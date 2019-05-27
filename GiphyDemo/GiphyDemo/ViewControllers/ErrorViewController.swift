//
//  ErrorViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 27/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    
    private let error: Error
    
    private lazy var errorIcon: UIImageView = {
        let image = UIImageView(frame: CGRect.zero)
        self.view.addSubview(image)
        image.fit(into: self.view, size: CGSize(width: 60, height: 60))
        
        return image
    }()
    
    init(error: Error) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        if error.isNoInternet {
            errorIcon.image = UIImage(named: "icon_error")
        }
        
    }
}

extension Error {
    
    var isNoInternet: Bool {
        return (self as? URLError)?.code == .notConnectedToInternet
    }
    
}
