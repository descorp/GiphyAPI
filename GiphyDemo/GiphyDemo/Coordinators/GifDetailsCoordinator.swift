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
    
    typealias Dependency = HasImageService & HasGiphyService
    
    private let model: Gif
    private let dependency: Dependency
    private var timer: Timer?
    
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
        
        let imageViewController = ImageViewController(imageUrl: model.images.original.url, dependency:dependency)
        imageViewController.imageView.contentMode = .scaleAspectFit
        transition.render(imageViewController)
        transition.view.backgroundColor = .black
        
        rootViewController.present(transition, animated: true, completion: nil)
        
        let timer = Timer(timeInterval: 10.0, repeats: true) { [weak self] timer in
            print("Tick")
            self?.onTick()
        }
        RunLoop.current.add(timer, forMode: .common)
        self.timer = timer
    }
    
    override func finish() {
        rootViewController.dismiss(animated: true, completion: nil)
        timer?.invalidate()
    }
    
    func onTick() {
        self.dependency.gifService.getRandom { [weak self] result in
            guard let dependency = self?.dependency,
                  let renderView = self?.rootViewController.presentedViewController as? RenderingViewController,
                case .success(let gif) = result else { return }
            
            DispatchQueue.main.async {
                let imageViewController = ImageViewController(imageUrl: gif.images.original.url, dependency:dependency)
                imageViewController.imageView.contentMode = .scaleAspectFit
                renderView.render(imageViewController)
            }
        }
    }
}
