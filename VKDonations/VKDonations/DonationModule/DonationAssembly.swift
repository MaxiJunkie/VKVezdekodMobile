//
//  DonationAssembly.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationAssembly {
    static func assemble(with type: DonationType) -> UIViewController {
            
        let view = DonationViewController()
        let viewModel = DonationViewModel(type: type)
        
        view.viewModel = viewModel
        
        switch type {
        case .regular:
            view.navigationItem.title = "Регулярный сбор"
        case .target:
            view.navigationItem.title = "Целевой сбор"
        }
        
        return view
    }
}
