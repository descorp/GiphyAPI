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
    private var size: CGSize?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        self.view.addSubview(imageView)
        imageView.fill(container: self.view)
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    init(imageUrl: String, size: CGSize? = nil, dependency: Dependency) {
        self.url = imageUrl
        self.dependency = dependency
        self.size = size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dependency.imageService.load(path: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(_):
                    print("failed loading image: \(self?.url)")
                case .success(let image):
                    self?.indicator.stopAnimating()
                    self?.imageView.image = image
                    self?.imageView.alpha = 0
                    UIView.animate(withDuration: 0.25, animations: {
                        self?.imageView.alpha = 1
                    })
                }
            }
        }
    }
}
