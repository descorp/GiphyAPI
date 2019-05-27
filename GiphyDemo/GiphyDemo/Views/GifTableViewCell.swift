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
    
    var controller: UIViewController?
    
    func update(context: Gif) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let controller = ImageViewController(imageUrl: context.images.fixedWidthDownsampled.url, dependency: AppDependency.shared)
        self.contentView.addSubview(controller.view)
        controller.view.fill(container: self.contentView, padding: UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0))
        self.controller = controller
        
        guard
            let imageHeight = Double(context.images.original.height),
            let widthHeight = Double(context.images.original.width)
        else { return }
        
        let screenwidth = UIScreen.main.bounds.width
        let height = CGFloat(imageHeight) * screenwidth / CGFloat(widthHeight)
        
        controller.view.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
