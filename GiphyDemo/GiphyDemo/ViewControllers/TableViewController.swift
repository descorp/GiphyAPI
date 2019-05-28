//
//  TableViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit


class TableViewController<T, Cell: TableCell, Source: DataSource>: UITableViewController
    where Cell.TableItem == T, Source.Item == T {
    
    let tableHandler: UniversalTableHandler<T, Cell, Source>
    
    init(dataSource: Source,
         style: UITableView.Style = .plain,
         onSelect: @escaping UniversalTableHandler<T, Cell, Source>.Action) {
        self.tableHandler = UniversalTableHandler(dataSource: dataSource, select: onSelect)
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableHandler.register(table: tableView)
    }
    
}
