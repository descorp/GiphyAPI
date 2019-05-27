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
        self.controller = ImageViewController(imageUrl: context.images.downsizedStill.url, dependency: AppDependency.shared)
        controller?.view.fill(container: self.contentView, padding: UIEdgeInsets.init(top: 32, left: 0, bottom: 0, right: 0))
    }
}
