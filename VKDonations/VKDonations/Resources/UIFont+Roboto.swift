//
//  UIFont+Roboto.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

extension UIFont {
    static func roboto(with weight: Weight) -> UIFont? {
        switch weight {
        case .light:
            return UIFont(name: "Roboto-Light", size: UIFont.labelFontSize)
    
        case .regular:
            return UIFont(name: "Roboto-Regular", size: UIFont.labelFontSize)
            
        case .bold:
            return UIFont(name: "Roboto-Bold", size: UIFont.labelFontSize)
            
        case .light:
            return UIFont(name: "Roboto-Light", size: UIFont.labelFontSize)
            
        default:
            return nil
            
        }
    }
}
