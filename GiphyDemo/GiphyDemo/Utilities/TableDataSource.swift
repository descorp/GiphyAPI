//
//  TableDataSource.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 27/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit
import GiphyAPI

protocol TableDataSource {
    associatedtype Item
    
    var count: Int { get }
    subscript(index: Int) -> Item { get set }
}

extension TableDataSource where Item:Equatable {
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

class GifsDataSource: NSObject, TableDataSource, UITableViewDataSourcePrefetching {
    
    typealias Item = Gif
    typealias Dependency = HasGiphyService
    
    private let dependency: Dependency
    private var collection: [Gif]
    private let pageSize: Int
    private let total: Int?
    private var loadTracker = Set<Int>()
    
    init(pageSize: Int = 25, total: Int? = nil, preset: [Gif] = [], dependency: Dependency) {
        self.dependency = dependency
        self.pageSize = pageSize
        self.collection = preset
        self.total = total
    }
    
    var count: Int {
        return total ?? collection.count
    }
    
    subscript(index: Int) -> Gif {
        get { return collection[index] }
        set(value) { collection[index] = value }
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let page = collection.count / pageSize
        if let maxRow = indexPaths.max()?.row,
            maxRow > Int(Double(collection.count) * 0.75),
            !loadTracker.contains(page) {
            let page = collection.count / pageSize
            loadTracker.insert(page)
            
            self.dependency.gifService.getTranding(limit: pageSize, page: page) { [weak self] result in
                switch result {
                case .success(let items):
                    self?.collection.append(contentsOf: items.data)
                case .failure(_):
                    print("Error while fetching page: \(page)")
                    self?.loadTracker.remove(page)
                }
            }
        }
    }
}
