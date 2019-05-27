//
//  ImageViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

final class ImageViewController: LoadingViewController {
    
    private let url: String
    private let loader: ImageLoader
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        self.view.addSubview(imageView)
        imageView.fill(container: self.view)
        return imageView
    }()
    
    init(imageUrl: String, loader: ImageLoader) {
        self.url = imageUrl
        self.loader = loader
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadImage(path: url) { [weak self] result in
            switch result {
                case .failure(_):
                    self?.imageView.image = UIImage(named: "icon_broken_image")
                case .success(let data):
                    self?.indicator.stopAnimating()
                    self?.imageView.image = UIImage(data: data)
            }
        }
    }
}
