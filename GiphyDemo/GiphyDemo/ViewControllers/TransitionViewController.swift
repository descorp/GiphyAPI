//
//  TransitionViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 28/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

class ModalViewController: RenderingViewController {
    
    typealias Action = () -> Void
    
    private let action: Action
    
    init(onClick: @escaping Action) {
        self.action = onClick
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClick)))
    }
    
    @objc func onClick() {
        self.action()
    }
}
