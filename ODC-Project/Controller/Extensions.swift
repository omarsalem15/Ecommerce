//
//  Extensions.swift
//  ODC-Project
//
//  Created by Omar Salem on 24/07/2023.
//

import UIKit

extension UIViewController{
    
    func navigateTo(_ vc : UIViewController) {
        navigationController?.pushViewController(vc,animated: true)
    }
}
