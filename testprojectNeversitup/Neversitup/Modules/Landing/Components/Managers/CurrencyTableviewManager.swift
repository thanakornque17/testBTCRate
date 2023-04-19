//
//  CurrencyTableviewManager.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit

public protocol TableViewManagerInterface: UITableViewDataSource, UITableViewDelegate {
    associatedtype DataType
    var dataList: [DataType] { get set }
    init(tableView: UITableView)
}

class CurrencyTableviewManager: NSObject, TableViewManagerInterface {
    typealias DataType = CurrencyCellElementType
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
        self.tableView.registerNib(CurrencyTableViewCell.self)
    }
}

extension CurrencyTableviewManager: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element: DataType = dataList[indexPath.row]
        switch element {
        case let .bpiDetail(bpiDetail):
            let cell: CurrencyTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(data: bpiDetail)
            return cell
        }
    }
}
