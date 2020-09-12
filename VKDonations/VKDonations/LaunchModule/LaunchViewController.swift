//
//  LaunchViewController.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class LaunchViewController: UIViewController {
    enum Spec {
        static let offsetBetweenTextAndButton: CGFloat = 20
        static let blueButtonSize = CGSize(width: 133, height: 36)
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "У Вас пока нет сборов \n Начните доброе дело."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: BlueButton = {
        let button = BlueButton()
        button.setTitle("Создать сбор", for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    @objc private func didTap() {
        let vc = DonationTypeAssembly.assemble()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

private extension LaunchViewController {
    func setupLayout() {
        view.backgroundColor = .white
        let barHeight = navigationController?.navigationBar.bounds.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        textLabel.sizeToFit()
        textLabel.center = CGPoint(
            x: view.center.x,
            y: view.center.y - (textLabel.bounds.height + Spec.offsetBetweenTextAndButton) / 2 - barHeight - statusBarHeight
        )
        view.addSubview(textLabel)
    
        button.bounds.size = Spec.blueButtonSize
        button.center = CGPoint(x: view.center.x, y: view.center.y + (Spec.blueButtonSize.height + Spec.offsetBetweenTextAndButton) / 2 - barHeight - statusBarHeight)
        view.addSubview(button)
    }
}
