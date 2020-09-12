//
//  DonationMultilineTextFieldCell.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 12.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

protocol Respondable {
    var isResponder: Bool { get }
}

final class DonationMultilineTextFieldCell: UICollectionViewCell, Respondable, UITextViewDelegate {
    
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
        
        textField.bounds.size = CGSize(width: bounds.width, height: 64)
        
        textField.frame.origin = CGPoint(x: 0, y: titleLabel.frame.maxY + 10)
    }
    
    func setModel(_ model: Model) {
        titleLabel.text = model.title
        placeHolder = model.placeholder
        textField.text = placeHolder
        textField.textColor = UIColor.getColor(hexString: "818C99")
        isPlaceholder = true
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = UIColor.getColor(hexString: "6D7885")
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.backgroundColor = UIColor.getColor(hexString: "F2F3F5")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.delegate = self
        textField.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
        contentView.addSubview(textField)
    }
    
    private var isPlaceholder = false
    private var placeHolder: String = ""
    private let textField = UITextView()
    private let titleLabel = UILabel()
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textField.text = placeHolder
            textField.textColor = UIColor.getColor(hexString: "818C99")
            isPlaceholder = true
        } else {
            textField.textColor = .black
            isPlaceholder = false
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isPlaceholder {
            textField.textColor = .black
            textView.text = ""
        } else {
            
        }
    }
    
}
