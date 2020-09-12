//
//  TypeDonationViewController.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationTypeViewController: UIViewController {
    enum Spec {
        static let xOffset: CGFloat = 20
        static let buttonHeight: CGFloat = 62
        static let offsetBetweenButtons: CGFloat = 10
    }
    
    private lazy var targetDonationButton: DonationButton = {
        let button = DonationButton()
        button.image = UIImage(named: "target_image")
        button.title = "Целевой сбор"
        button.subTitle = "Когда есть определённая цель"
        return button
    }()
    
    private lazy var regularDonationButton: DonationButton = {
        let button = DonationButton()
        button.image = UIImage(named: "regular_image")
        button.title = "Регулярный сбор"
        button.subTitle = "Если помощь нужна ежемесячно"
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        targetDonationButton.bounds.size = CGSize(
            width: view.bounds.width - 2 * Spec.xOffset,
            height: Spec.buttonHeight
        )
        
        let barHeight = navigationController?.navigationBar.bounds.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        targetDonationButton.center = CGPoint(
            x: view.center.x,
            y: view.center.y - (targetDonationButton.bounds.height + Spec.offsetBetweenButtons) / 2 - barHeight - statusBarHeight
        )
        
        regularDonationButton.bounds.size = CGSize(
            width: view.bounds.width - 2 * Spec.xOffset,
            height: Spec.buttonHeight
        )
        
        regularDonationButton.center = CGPoint(
            x: view.center.x,
            y: view.center.y + (regularDonationButton.bounds.height + Spec.offsetBetweenButtons) / 2 - barHeight - statusBarHeight
        )
        
        view.addSubview(targetDonationButton)
        view.addSubview(regularDonationButton)
        
        targetDonationButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapTargetDonationButton))
        )
        
        regularDonationButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapRegularDonationButton))
        )
    }
    
    @objc private func didTapTargetDonationButton() {
        let vc = DonationAssembly.assemble(with: .target)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapRegularDonationButton() {
        let vc = DonationAssembly.assemble(with: .regular)
        navigationController?.pushViewController(vc, animated: true)
    }
}
