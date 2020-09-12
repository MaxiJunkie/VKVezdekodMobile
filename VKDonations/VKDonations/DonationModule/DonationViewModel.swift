//
//  DonationViewModel.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationViewModel {
    private(set) var sections: [DonationSection]

    func updateSection(with image: UIImage?) {
        sections.removeFirst()
        sections.insert(DonationSection(items: [.photo(image: image)], insets: firstSectionInset, minimumLineSpacing: 0), at: 0)
    }
    
    let type: DonationType
    private let firstSectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
 
    init(type: DonationType) {
        self.type = type
        
        var textFieldItems: [DonationItem] = [.name(.init(title: "Название сбора", placeholder: "Название сбора"))]
        
        switch type {
        case .target:
            textFieldItems.append(.ammount(.init(title: "Сумма, ₽", placeholder: "Сколько нужно собрать?")))
            textFieldItems.append(.purpose(.init(title: "Цель", placeholder: "Например, лечение человека")))
        case .regular:
            textFieldItems.append(.ammount(.init(title: "Сумма в месяц, ₽", placeholder: "Сколько нужно в месяц?")))
            textFieldItems.append(.purpose(.init(title: "Цель", placeholder: "Например, поддержка приюта")))
        }
        
        textFieldItems.append(.description(.init(title: "Описание", placeholder: "На что пойдут деньги и как они кому-то помогут?")))
        textFieldItems.append(.title(.init(title: "Куда получать деньги", placeholder: "Счёт VK Pay · 1234")))
        
        if type == .regular {
            textFieldItems.append(.title(.init(title: "Автор", placeholder: "Максим Стегниенко")))
        }
        
        sections = [
            .init(items: [.photo(image: nil)], insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), minimumLineSpacing: 0),
            .init(items: textFieldItems, insets: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), minimumLineSpacing: 0)
        ]
        
    }
    
}
