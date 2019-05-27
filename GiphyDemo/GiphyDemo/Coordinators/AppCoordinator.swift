//
//  AppCoordinator.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 23/10/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit
import ApiProvider
import GiphyAPI

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
        let root = RenderingViewController()
        root.view.backgroundColor = .groupTableViewBackground
        super.init(withRootController: root)
        
        window.rootViewController = self.rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let gifsCoordinator = GifListCoodrinator(withRootViewController: self.rootViewController,
                                                  parentCoordinator: nil,
                                                  dependency: AppDependency.shared)
        self.childCoordinators.append(gifsCoordinator)
        gifsCoordinator.start()
    }
    
    override func finish() { }
}

extension AppDependency {
    static var shared: AppDependency = {
        var ioc = AppDependency()
        let config = Configuration(bundle: Bundle.main)
        let giphyService = GiphyService(requestBuilder: GiphyRequestBuilder(with: config))
        ioc.add(giphyService, as: ImageLoader.self)
        ioc.add(giphyService, as: DataProvider.self)
        ioc.add(ImageChache(dependency: ioc), as: ImageService.self)
        return ioc
    }()
}
