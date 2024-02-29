//
//  QuestionView.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = false
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = false
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = false
    }
}
