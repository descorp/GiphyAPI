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
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.render(LoadingViewController())
        
        dependency.gifService.getTranding(limit: 25, page: 0) { result in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                switch result {
                case .success(let pagenable):
                    let dataSource = GifsDataSource(pageSize: 25,
                                                    total: pagenable.total,
                                                    preset: pagenable.data,
                                                    dependency: strongSelf.dependency)
                    let controller = TableViewController<Gif, GifTableViewCell, GifsDataSource>(dataSource: dataSource)
                    controller.tableView.separatorStyle = .none
                    strongSelf.rootViewController.render(controller)
                case .failure(let error):
                    let controller = ErrorViewController(error: error)
                    strongSelf.rootViewController.render(controller)
                }
            }
        }
    }
}
