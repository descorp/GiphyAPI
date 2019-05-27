//
//  RenderingViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

final class RenderingViewController: UINavigationController {
    private let animator = Animator()
    private var renderee: UIViewController?
    
    override func viewDidLoad() {
        self.delegate = self
    }
    
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

extension RenderingViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let toVC = context.viewController(forKey: UITransitionContextViewControllerKey.to)
        else { return }
        
        UIView.animate(withDuration: 0.5) { context.containerView.alpha = 0 }
        context.containerView.subviews.forEach { $0.removeFromSuperview() }
        context.containerView.addSubview(toVC.view)
        toVC.view.fill(container: context.containerView)
        
        UIView.animate(withDuration: 0.5) { context.containerView.alpha = 1 }
        context.completeTransition(!context.transitionWasCancelled)
    }
}
