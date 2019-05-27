//
//  ImageViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

final class ImageViewController: LoadingViewController {
    typealias Dependency = HasImageService
    
    private let url: String
    private let dependency: Dependency
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        self.view.addSubview(imageView)
        imageView.fill(container: self.view)
        return imageView
    }()
    
    init(imageUrl: String, dependency: Dependency) {
        self.url = imageUrl
        self.dependency = dependency
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dependency.imageService.load(path: url) { [weak self] result in
            switch result {
                case .failure(_):
                    self?.imageView.image = UIImage(named: "icon_broken_image")
                case .success(let image):
                    self?.indicator.stopAnimating()
                    self?.imageView.image = image
            }
        }
    }
}
