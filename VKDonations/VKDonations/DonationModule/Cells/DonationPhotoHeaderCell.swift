//
//  DonationPhotoHeaderCell.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit
 
final class DonationPhotoHeaderCell: UICollectionViewCell {
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_photo")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 73 / 255, green: 134 / 255, blue: 204 / 255, alpha: 1)
        label.text = "Загрузить обложку"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
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
        
        border.frame = bounds
        border.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
        
        iconImage.sizeToFit()
        titleLabel.sizeToFit()
        
        titleLabel.center = CGPoint(
            x: contentView.center.x + iconImage.bounds.width / 2 + 10,
            y: contentView.center.y
        )
        
        iconImage.center = CGPoint(
            x: titleLabel.frame.origin.x - 10 - iconImage.bounds.width / 2,
            y: contentView.center.y
        )
        
        imageView.bounds.size = bounds.size
        imageView.center = contentView.center
    }
    
    func setImage(_ image: UIImage?) {
        guard let image = image else {
            imageView.isHidden = true
            return
        }
        
        imageView.image = image
        imageView.isHidden = false
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        border.strokeColor = UIColor(displayP3Red: 73 / 255, green: 134 / 255, blue: 204 / 255, alpha: 1).cgColor
        border.lineDashPattern = [6, 3]
        border.fillColor = nil
        contentView.layer.addSublayer(border)
        
        contentView.addSubview(iconImage)
        contentView.addSubview(titleLabel)
        
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        contentView.addSubview(imageView)
    }
    
    private let border = CAShapeLayer()
    private let imageView = UIImageView()
}
