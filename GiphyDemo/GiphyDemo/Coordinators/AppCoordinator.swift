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
    lazy var dependency: AppDependency = {
        var ioc = AppDependency()
        let config = Configuration(bundle: Bundle.main)
        let giphyService = GiphyService(requestBuilder: GiphyRequestBuilder(with: config))
        ioc.add(giphyService, as: ImageLoader.self)
        ioc.add(giphyService, as: GiphyService.self)
        ioc.add(ImageChache(dependency: ioc), as: ImageService.self)
        return ioc
    }()
    
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
        super.init(withRootController: RenderingViewController())
        
        window.rootViewController = self.rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let gifsCoordinator = GifListCoodrinator(withRootViewController: self.rootViewController,
                                                  parentCoordinator: nil,
                                                  dependency: dependency)
        self.childCoordinators.append(gifsCoordinator)
        gifsCoordinator.start()
    }
    
    override func finish() {
        
    }
    
}
