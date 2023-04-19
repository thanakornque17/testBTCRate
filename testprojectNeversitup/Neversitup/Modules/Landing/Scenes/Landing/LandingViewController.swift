//
//  LandingViewController.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit
import SwiftLoader

protocol LandingDisplayLogic: AnyObject {
    func displayLoading(viewModel: LandingModels.Loading.ViewModel)
    func displayCurrentPrice(viewModel: LandingModels.DataCurrentPrice.ViewModel)
    func displayBTCRate(viewModel: LandingModels.BitCoinPrice.ViewModel)
}

class LandingViewController: UIViewController {

    var interactor: LandingBusinessLogic?
    var router: LandingRoutingLogic?
    
    var tableViewManager: CurrencyTableviewManager!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var btcRateLabel: UILabel!
    
    private func setup() {
        let viewController = self
        let interactor = LandingInteractor()
        let presenter = LandingPresenter()
        let router = LandingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TEST"
        setup()
        setupView()
        interactor?.startFetchCurrentPriceInterval()
    }
    
    private func setupView() {
        tableViewManager = CurrencyTableviewManager(tableView: tableView)
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        interactor?.segmentedIndexChange(index: segmentedControl.selectedSegmentIndex)
        inputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func recordAction(_ sender: UIBarButtonItem) {
        router?.navigateToRecondScreen()
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        interactor?.segmentedIndexChange(index: segmentedControl.selectedSegmentIndex)
    }
}

extension LandingViewController: LandingDisplayLogic {
    func displayLoading(viewModel: LandingModels.Loading.ViewModel) {
        if viewModel.isShow {
            SwiftLoader.show(animated: viewModel.isShow)
        } else {
            SwiftLoader.hide()
        }
    }
    
    func displayCurrentPrice(viewModel: LandingModels.DataCurrentPrice.ViewModel) {
        tableViewManager.dataList = viewModel.elements
    }
    
    func displayBTCRate(viewModel: LandingModels.BitCoinPrice.ViewModel) {
        btcRateLabel.text = viewModel.bitCoin
    }
}

extension LandingViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        interactor?.textRateChange(text: textField.text ?? "")
    }
}
