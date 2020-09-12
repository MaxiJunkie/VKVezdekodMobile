//
//  DonationSection.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

struct DonationSection {
    
    let items: [DonationItem]
    let insets: UIEdgeInsets
    let minimumLineSpacing: CGFloat
}

enum DonationItem {
    
    case photo(image: UIImage?)
    case name(DonationTextFieldCell.Model)
    case ammount(DonationTextFieldCell.Model)
    case purpose(DonationTextFieldCell.Model)
    case description(DonationMultilineTextFieldCell.Model)
    case title(DonationTitleCell.Model)
    
    func cell(for indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        
        switch self {
        case .photo(let image):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationPhotoHeaderCell", for: indexPath) as! DonationPhotoHeaderCell
            cell.setImage(image)
            return cell
            
        case .name(let model), .ammount(let model), .purpose(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationTextFieldCell", for: indexPath) as! DonationTextFieldCell
            cell.setModel(model)
            return cell
            
        case .description(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationMultilineTextFieldCell", for: indexPath) as! DonationMultilineTextFieldCell
            cell.setModel(model)
            return cell
            
        case .title(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationTitleCell", for: indexPath) as! DonationTitleCell
            cell.setModel(model)
            return cell
        }
        
    }
    
}
