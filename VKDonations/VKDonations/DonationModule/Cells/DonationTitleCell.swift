//
//  DonationTitleCell.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 12.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationTitleCell: UICollectionViewCell {
    
    struct Model {
        let title: String
        let placeholder: String
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        titleLabel.frame.origin = CGPoint(x: 0, y: 12)
        
        textField.bounds.size = CGSize(width: bounds.width, height: 44)
        
        textField.frame.origin = CGPoint(x: 0, y: titleLabel.frame.maxY + 10)
        
        rightView.sizeToFit()
        rightView.frame.origin = CGPoint(x: bounds.width - rightView.bounds.width - 20,
                                         y: (textField.bounds.height - rightView.bounds.height) / 2)
    }
    
    func setModel(_ model: Model) {
        titleLabel.text = model.title
        
        textField.text = model.placeholder
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = UIColor.getColor(hexString: "6D7885")
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        textField.isEnabled = false
        textField.backgroundColor = UIColor.getColor(hexString: "F2F3F5")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(textField)
        
        textField.addSubview(rightView)
    }
    
    private let textField = CustomTextField()
    private let titleLabel = UILabel()
    private let rightView = UIImageView(image: UIImage(named: "arrow_bottom"))
 
}
