//
//  TableDataSource.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 27/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

protocol DataSource {
    associatedtype Item
    
    var count: Int { get }
    subscript(index: Int) -> Item { get set }
}

extension DataSource where Item:Equatable {
    mutating func updateItem(_ newItem: Item) -> Int? {
        for i in 0...count {
            let item = self[i]
            if item == newItem {
                self[i] = item
                return i
            }
        }
        return nil
    }
}
