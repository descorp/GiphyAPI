//
//  GifTableViewCell.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 27/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit
import GiphyAPI

class GifTableViewCell: UITableViewCell, TableCell {
    typealias Dependency = HasImageLoader
    
    private let padding: CGFloat = 44
    
    var controller: UIViewController?
    
    func update(context: Gif) {
        self.selectionStyle = .none
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let imageController = ImageViewController(imageUrl: context.images.fixedWidth.url, dependency: AppDependency.shared)
        self.contentView.addSubview(imageController.view)
        imageController.view.fill(container: self.contentView, padding: UIEdgeInsets(top: -padding / 2,
                                                                                     left: 0,
                                                                                     bottom: padding / 2,
                                                                                     right: 0))
        self.controller = imageController
        
        guard
            let imageHeight = Double(context.images.original.height),
            let widthHeight = Double(context.images.original.width)
        else { return }
        
        let screenwidth = UIScreen.main.bounds.width
        let height = (CGFloat(imageHeight) * screenwidth / CGFloat(widthHeight))
        imageController.view.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
    }
}

extension GifTableViewCell: Highlighable {
    
    func highlight() {
        UIView.animate(withDuration: 0.5) {
            self.controller?.view.transform = .init(scaleX: 0.9, y: 0.9)
        }
    }
    
    func unhighlight() {
        UIView.animate(withDuration: 0.5) {
            self.controller?.view.transform = .identity
        }
    }
}
