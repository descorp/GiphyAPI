//
//  DetailsCoordinator.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit
import GiphyAPI

class GifDetailsCoordinator: Coordinator {
    
    typealias Dependency = HasImageService
    
    private let model: Gif
    private let dependency: Dependency
    
    init(model: Gif,
        root viewController: RenderingViewController,
        dependency: Dependency,
        andParentCoordinator parentCoordinator: Coordinator?) {
        self.model = model
        self.dependency = dependency
        super.init(withRootController: viewController, andParentCoordinator: parentCoordinator)
    }
    
    override func start() {
        let transition = ModalViewController { [weak self] in
            self?.finish()
        }
        
        let imageViewController = ImageViewController(imageUrl: model.images.original.url, size: , dependency:dependency)
        imageViewController.imageView.contentMode = .scaleAspectFit
        transition.render(imageViewController)
        
        rootViewController.present(transition, animated: true, completion: nil)
    }
    
    override func finish() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
    
    func viewModelDidThrowError(_ viewModel: Gif, error: Error?) {
    }
    
    
}
