//
//  SnippetViewController.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 12.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class SnippetViewController: UIViewController {
    enum Spec {
        static let xOffset: CGFloat = 20
        static let helpButtonSize = CGSize(width: 86, height: 30)
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Сейчас самое время помочь тем, кто не может попросить о помощи сам."
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let helpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Помочь", for: .normal)
        button.setTitleColor(UIColor.getColor(hexString: "3F8AE0"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.getColor(hexString: "3F8AE0").cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    private let contentView = UIView()
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = "Помогите первым"
        return label
    }()
    
    private lazy var progress: UIView = {
        let view = UIView()
        view.bounds.size = CGSize(width: 0, height: 4)
        view.layer.cornerRadius = 2
        view.frame.origin = .zero
        view.backgroundColor = UIColor.getColor(hexString: "3F8AE0")
        return view
    }()
    
    private let progressView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        titleLabel.frame.origin = CGPoint(x: Spec.xOffset, y: 20)
        titleLabel.frame.size = CGSize(width: view.bounds.width - 2 * Spec.xOffset, height: 40)
        view.addSubview(titleLabel)
        
        contentView.frame = CGRect(
            x: Spec.xOffset,
            y: titleLabel.frame.maxY + 10,
            width: view.bounds.width - 2 * Spec.xOffset,
            height: (view.bounds.width - 2 * Spec.xOffset) * 246 / 359
        )
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 0.5
                
        view.addSubview(contentView)
        
        let image = UIImage(named: "testImage")
        let imageView = UIImageView(image: image)
        let imageSize = image?.size ?? .zero
        let imageHeight = contentView.bounds.width * (imageSize.height / imageSize.width)
        imageView.frame = CGRect(
            origin: .zero,
            size: CGSize(width: contentView.bounds.width, height: imageHeight)
        )
        contentView.addSubview(imageView)
        
        let label = UILabel()
        label.text = "Добряши помогают котикам"
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        label.frame = CGRect(
            x: 16,
            y: imageView.frame.maxY + 10,
            width: contentView.bounds.width - 32,
            height: 20
        )
        contentView.addSubview(label)
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = "Матвей Правосудов · Помощь нужна каждый месяц"
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textColor = UIColor.getColor(hexString: "818C99")
        subTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        subTitleLabel.frame = CGRect(
            x: 16,
            y: label.frame.maxY,
            width: contentView.bounds.width - 32,
            height: 20
        )
        
        contentView.addSubview(subTitleLabel)
        
        let separator = UIView()
        separator.backgroundColor = UIColor.lightGray
        separator.frame = CGRect(x: 16, y: subTitleLabel.frame.maxY + 5, width: contentView.bounds.width - 32, height: 0.5)
        contentView.addSubview(separator)
        
        let yOffset = (contentView.bounds.height - separator.frame.maxY - Spec.helpButtonSize.height) / 2
        helpButton.frame = CGRect(
            x: contentView.bounds.width - Spec.helpButtonSize.width - 16,
            y: separator.frame.maxY + yOffset,
            width: Spec.helpButtonSize.width,
            height: Spec.helpButtonSize.height
        )
        
        contentView.addSubview(helpButton)
        
        stateLabel.frame = CGRect(
            x: 16,
            y: separator.frame.maxY + 6,
            width: contentView.bounds.width - 32,
            height: 20
        )
        
        contentView.addSubview(stateLabel)
        
        progressView.backgroundColor = UIColor.getColor(hexString: "3F8AE0").withAlphaComponent(0.5)
        progressView.layer.cornerRadius = 2
        progressView.frame = CGRect(
            x: 16,
            y: helpButton.frame.maxY - 4,
            width: contentView.bounds.width - 32 - helpButton.frame.width - 16,
            height: 4
        )
        
        contentView.addSubview(progressView)
        progressView.addSubview(progress)
    }
    
    private var count: CGFloat = 0 {
        didSet {
            switch count {
            case 0.0:
                stateLabel.text = "Помогите первым"
            case 0.2:
                stateLabel.text = "Собрано 2 000 ₽ из 10 000 ₽"
            case 0.4:
                stateLabel.text = "Собрано 4 000 ₽ из 10 000 ₽"
            case 0.6:
                stateLabel.text = "Собрано 6 000 ₽ из 10 000 ₽"
            case 0.8:
                stateLabel.text = "Собрано 8 000 ₽ из 10 000 ₽"
            case 1.0:
                stateLabel.text = "Собрано 10 000 ₽ из 10 000 ₽"
                helpButton.isEnabled = false
                helpButton.alpha = 0.5
            default:
                return
            }
        }
    }
    
    @objc private func didTap() {
        
        if count == 1.0 {
            count = 0
        } else {
            count += 0.2
        }
        
        UIView.animate(withDuration: 0.2) {
            self.progress.frame.size.width = self.progressView.bounds.width * self.count
        }
        
    }
}
