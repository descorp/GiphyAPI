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
        let viewController = ImageViewController(imageUrl: model.images.original.webp, dependency:dependency)
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        rootViewController.popViewController(animated: true)
    }
    
    func viewModelDidThrowError(_ viewModel: Gif, error: Error?) {
    }
    
    
}
