//
//  BlueButton.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class BlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = UIColor(displayP3Red: 73 / 255, green: 134 / 255, blue: 204 / 255, alpha: 1)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
}
