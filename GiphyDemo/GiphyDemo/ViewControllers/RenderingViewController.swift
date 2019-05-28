//
//  RenderingViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

class RenderingViewController: UINavigationController {
    private var renderee: UIViewController?
    
    func render(_ viewController: UIViewController) {
        renderee = viewController
        UIView.animate(withDuration: 0.5) { self.view.alpha = 0 }
        DispatchQueue.main.async {
            self.view.subviews.forEach { $0.removeFromSuperview() }
            self.view.addSubview(viewController.view)
            viewController.view.fill(container: self.view)
        }
        UIView.animate(withDuration: 0.5) { self.view.alpha = 1 }
    }
}
