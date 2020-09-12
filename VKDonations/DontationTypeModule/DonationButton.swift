//
//  DonationButton.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationButton: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subTitle: String? {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
    
    private let imageView = UIImageView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.getColor(hexString: "6D7885")
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow_image")
        return imageView
    }()
    
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
        
        imageView.frame.origin = CGPoint(x: 12, y: 12)
        imageView.sizeToFit()
        
        titleLabel.frame.origin = CGPoint(x: imageView.frame.maxX + 10, y: 12)
        titleLabel.sizeToFit()
        
        subTitleLabel.frame.origin = CGPoint(x: imageView.frame.maxX + 10, y: titleLabel.bounds.maxY + 15)
        subTitleLabel.sizeToFit()
        
        arrowImageView.sizeToFit()
        arrowImageView.frame.origin = CGPoint(
            x: bounds.width - arrowImageView.bounds.width - 10,
            y: (bounds.height - arrowImageView.bounds.height) / 2
        )
    }
    
    private func setupLayout() {
        addSubview(imageView)
        backgroundColor = UIColor.getColor(hexString: "F5F5F5")
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(arrowImageView)
    }
    
}
