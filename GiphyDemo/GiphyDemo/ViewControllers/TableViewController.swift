//
//  TableViewController.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit


class TableViewController<T, Cell: TableCell, Source: TableDataSource>: UITableViewController
    where Cell.TableItem == T, Source.Item == T {
    
    let tableHandler: UniversalTableHandler<T, Cell, Source>
    
    init(dataSource: Source, style: UITableView.Style = .plain) {
        self.tableHandler = UniversalTableHandler(dataSource: dataSource)
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
