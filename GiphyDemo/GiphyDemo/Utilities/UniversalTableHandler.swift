//
//  UniversalTableHandler.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit

protocol TableCell: UITableViewCell {
    associatedtype TableItem
    func update(context: TableItem)
    static var cellIdentifier: String { get }
    static func registerCell(in tableview: UITableView)
}

protocol Highlighable {
    func highlight()
    func unhighlight()
}

extension TableCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    static func registerCell(in table: UITableView) {
        table.register(self, forCellReuseIdentifier: cellIdentifier)
    }
}

class UniversalTableHandler<T, Cell: TableCell, Source: TableDataSource> : NSObject, UITableViewDelegate, UITableViewDataSource
where Cell.TableItem == T, Source.Item == T {

    typealias Action = (T)->Void
    
    private var dataSource: Source
    private let selectAction: Action?
    private weak var table: UITableView?
    
    public init(dataSource: Source, select: Action? = nil){
        self.selectAction = select
        self.dataSource = dataSource
        super.init()
    }
    
    public func register(table: UITableView, useFooter: Bool = true) {
        self.table = table
        table.dataSource = self
        table.delegate = self
        Cell.registerCell(in: table)
        if useFooter { table.tableFooterView = UIView() }
        if let prefetchDataSource = dataSource as? UITableViewDataSourcePrefetching { table.prefetchDataSource = prefetchDataSource }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count:  \(dataSource.count)")
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier) as? Cell else {
            return UITableViewCell(style: .default, reuseIdentifier: Cell.cellIdentifier)
        }
        
        let item = dataSource[indexPath.item]
        cell.update(context: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = dataSource[indexPath.item]
        self.selectAction?(item)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? Highlighable {
            cell.highlight()
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? Highlighable {
            cell.unhighlight()
        }
    }
}

extension UniversalTableHandler where T: Equatable {
    func updateCollectionWith(item: T) {
        guard let index = dataSource.updateItem(item) else { return }
        table?.reloadRows(at: [IndexPath(item: index, section: 0)], with: .fade)
    }
}
