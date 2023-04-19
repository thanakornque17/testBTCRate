//
//  RecondViewController.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit
import SwiftLoader

protocol RecondDisplayLogic: AnyObject {
    func displayLoading(viewModel: RecondModels.Loading.ViewModel)
    func displayCurrentPrice(viewModel: RecondModels.DataCurrentPrice.ViewModel)
}

class RecondViewController: UIViewController {

    var interactor: RecondBusinessLogic?

    var tableViewManager: RecondTableviewManager!
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RECOND"
        setup()
        setupView()
        interactor?.fetchCurrentPrice()
    }
    
    private func setup() {
        let viewController = self
        let interactor = RecondInteractor()
        let presenter = RecondPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func setupView() {
        tableViewManager = RecondTableviewManager(tableView: tableView)
    }
}

extension RecondViewController: RecondDisplayLogic {
    func displayLoading(viewModel: RecondModels.Loading.ViewModel) {
        if viewModel.isShow {
            SwiftLoader.show(animated: viewModel.isShow)
        } else {
            SwiftLoader.hide()
        }
    }
    
    func displayCurrentPrice(viewModel: RecondModels.DataCurrentPrice.ViewModel) {
        tableViewManager.dataList = viewModel.elements
    }
}
