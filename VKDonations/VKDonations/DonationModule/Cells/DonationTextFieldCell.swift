//
//  DonationTextFieldCell.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationTextFieldCell: UICollectionViewCell, Respondable {
    
    var isResponder: Bool {
        return textField.isFirstResponder
    }
    
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
    }
    
    func setModel(_ model: Model) {
        titleLabel.text = model.title
        
        textField.attributedPlaceholder = NSAttributedString(
            string: model.placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.getColor(hexString: "818C99")]
        )
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = UIColor.getColor(hexString: "6D7885")
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        textField.backgroundColor = UIColor.getColor(hexString: "F2F3F5")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(textField)
    }
    
    let textField = CustomTextField()
    private let titleLabel = UILabel()
 
}

final class CustomTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 0)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 0)
    }
}
