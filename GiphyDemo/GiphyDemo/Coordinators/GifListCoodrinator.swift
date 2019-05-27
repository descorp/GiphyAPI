//
//  NowInCinemaCoodrinator.swift
//  InCinema
//
//  Created by Vladimir Abramichev on 23/10/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit
import GiphyAPI

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
        let detaSource = GifsDataSource(dependency: self.dependency)
        navigationController.pushViewController(TableViewController<Gif, GifTableViewCell, GifsDataSource>(dataSource: detaSource) , animated: true)
    }
}
