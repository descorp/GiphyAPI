//
//  UIViewExtension.swift
//  InCinema
//
//  Created by Vladimir Abramichev on 28/10/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fill(container: UIView, padding: UIEdgeInsets = UIEdgeInsets.zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        [container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: padding.right),
         container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding.left),
         container.topAnchor.constraint(equalTo: self.topAnchor, constant: padding.top),
         container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding.bottom)]
            .forEach { $0.isActive = true }
    }
    
    func fit(into container: UIView, size: CGSize, offset: UIOffset = UIOffset.zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        [container.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: offset.horizontal),
         container.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: offset.vertical),
         self.heightAnchor.constraint(equalToConstant: size.height),
         self.widthAnchor.constraint(equalToConstant: size.width)]
            .forEach { $0.isActive = true }
    }
    
}
