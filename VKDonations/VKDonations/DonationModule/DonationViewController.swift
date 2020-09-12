//
//  DonationViewController.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class CustomCollectionView: UICollectionView {
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        endEditing(true)
    }
    
}

final class DonationViewController: UIViewController, ImagePickerDelegate {
    enum Spec {
        static let xOffset: CGFloat = 20
    }
    
    var viewModel: DonationViewModel!
    
    private lazy var imagePicker = ImagePicker(presentationController: self, delegate: self)
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = CustomCollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DonationPhotoHeaderCell.self, forCellWithReuseIdentifier: "DonationPhotoHeaderCell")
        collectionView.register(DonationTextFieldCell.self, forCellWithReuseIdentifier: "DonationTextFieldCell")
        collectionView.register(DonationMultilineTextFieldCell.self, forCellWithReuseIdentifier: "DonationMultilineTextFieldCell")
        collectionView.register(DonationTitleCell.self, forCellWithReuseIdentifier: "DonationTitleCell")
        //collectionView.keyboardDismissMode = .onDrag
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        let height: CGFloat
    
        let cell = collectionView.visibleCells.first {
            if let cell = $0 as? Respondable {
                return cell.isResponder
            } else {
                return false
            }
        }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            height = .zero
        } else {
            height = cell?.frame.origin.y ?? 0
        }
        
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        let buttonHeight: CGFloat = 64 + bottom
        collectionView.setContentOffset(CGPoint(x: 0, y: height), animated: true)
        UIView.animate(withDuration: 0.5) {
            if notification.name == UIResponder.keyboardWillHideNotification {
                self.contentView.frame.origin.y = keyboardViewEndFrame.origin.y - buttonHeight
            } else {
                let barHeight = self.navigationController?.navigationBar.bounds.height ?? 0
                let statusBarHeight = UIApplication.shared.statusBarFrame.height
                
                if self.contentView.frame.origin.y >= self.view.bounds.height - barHeight - statusBarHeight - buttonHeight {
                    self.contentView.frame.origin.y -= keyboardViewEndFrame.height
                }
            }
        }
          
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let barHeight = navigationController?.navigationBar.bounds.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        let buttonHeight: CGFloat = 64 + bottom
        
        collectionView.bounds.size = CGSize(width: view.bounds.width, height: view.bounds.height - barHeight - statusBarHeight - buttonHeight)
        collectionView.frame.origin = .zero
        view.addSubview(collectionView)
        
        collectionView.reloadData()
        
        contentView.backgroundColor = .white
        
        contentView.frame = CGRect(x: 0,
                                   y: view.bounds.height - barHeight - statusBarHeight - buttonHeight,
                                   width: view.bounds.width,
                                   height: buttonHeight)
        
        let blueButton = BlueButton()
        blueButton.setTitle("Далее", for: .normal)
        blueButton.frame = CGRect(x: 16, y: 10, width: view.bounds.width - 32, height: 44)
        blueButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        contentView.addSubview(blueButton)
        view.addSubview(contentView)
    }
    
    func didSelect(image: UIImage?) {
        viewModel.updateSection(with: image)
        collectionView.reloadItems(at: [IndexPath(item: 0, section: 0)])
    }
    
    @objc private func didTap() {
        let vc = SnippetAssembly.aseemble(with: viewModel.type)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let contentView = UIView()
}

// MARK: - UICollectionViewDelegate
extension DonationViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.sections[indexPath.section].items[indexPath.item]
        
        switch item {
        case .photo:
            imagePicker.present()
            
        case .name:
            break
            
        case .ammount:
            break
            
        case .purpose:
            break
            
        case .description:
            break
        case .title:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource
extension DonationViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.sections[indexPath.section].items[indexPath.item]
        return item.cell(for: indexPath, collectionView: collectionView)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DonationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = viewModel.sections[indexPath.section].items[indexPath.item]
        let width = collectionView.bounds.width - 2 * Spec.xOffset
       
        switch item {
        case .photo:
            return CGSize(width: width, height: width * 140 / 351)
            
        case .name, .ammount, .purpose, .title:
            return CGSize(width: width, height: 96)
            
        case .description:
            return CGSize(width: width, height: 116)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return viewModel.sections[section].insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.sections[section].minimumLineSpacing
    }
    
}
