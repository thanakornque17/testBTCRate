//
//  RecondTableviewManager.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit

class RecondTableviewManager: NSObject, TableViewManagerInterface {
    typealias DataType = RecondCellElementType
    var dataList: [DataType] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    weak var tableView: UITableView!
    
    required init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 90.0
        self.tableView.registerNib(RecondTableViewCell.self)
    }
}

extension RecondTableviewManager: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element: DataType = dataList[indexPath.row]
        switch element {
        case let .currentPrice(currentPrice):
            let cell: RecondTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(data: currentPrice)
            return cell
        }
    }
}

