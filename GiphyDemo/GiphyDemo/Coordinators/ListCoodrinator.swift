//
//  NowInCinemaCoodrinator.swift
//  InCinema
//
//  Created by Vladimir Abramichev on 23/10/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class GifListCoodrinator: Coordinator {
    typealias Dependency = HasImageService & HasGiphyService
    
    let dependency: Dependency
    
    init(withRootViewController viewController: RenderingViewController,
         parentCoordinator coordinator: Coordinator?,
         dependency: Dependency) {
        self.dependency = dependency
        super.init(withRootController: viewController, andParentCoordinator: coordinator)
    }
    
    override func start() {
        guard
            let navigationController =  rootViewController.navigationController
        else { return }
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(LoadingViewController(), animated: true)
        
        dependency.gifService.getTranding(limit: 25, page: 0) { [weak self] result in
            guard case .success(let items) = result else { return }
            
            navigationController.popViewController(animated: true)
            
            //navigationController.pushViewController(TableViewController , animated: true)
        }
    }
}
