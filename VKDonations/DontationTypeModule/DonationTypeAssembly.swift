//
//  DonationTypeAssembly.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class DonationTypeAssembly {
    static func assemble() -> UIViewController {
        let view = DonationTypeViewController()
        view.navigationItem.title = "Тип сбора"
        return view
    }
}
