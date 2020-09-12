//
//  SnippetAssembly.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 12.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

final class SnippetAssembly {
    static func aseemble(with type: DonationType) -> UIViewController {
        
        let view = SnippetViewController()
        view.navigationItem.title = "Snippet"
        return view
    }
}
