//
//  LandingPresenter.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit

protocol LandingPresentationLogic {
    func presentLoading(response: LandingModels.Loading.Response)
    func presentCurrentPrice(response: LandingModels.DataCurrentPrice.Response)
    func presentBTCRate(viewModel: LandingModels.BitCoinPrice.Response)
}

class LandingPresenter: LandingPresentationLogic {
    
    weak var viewController: LandingDisplayLogic?
    
    func presentLoading(response: LandingModels.Loading.Response) {
        let viewModel = LandingModels.Loading.ViewModel(isShow: response.isShow)
        viewController?.displayLoading(viewModel: viewModel)
    }
    
    func presentCurrentPrice(response: LandingModels.DataCurrentPrice.Response) {
        let dataBuilder = CurrencyDataBuilder(currentPrice: response.data)
        let viewModel = LandingModels.DataCurrentPrice.ViewModel(elements: dataBuilder.build())
        viewController?.displayCurrentPrice(viewModel: viewModel)
    }
    
    func presentBTCRate(viewModel: LandingModels.BitCoinPrice.Response) {
        let viewModel = LandingModels.BitCoinPrice.ViewModel(bitCoin: viewModel.rate)
        viewController?.displayBTCRate(viewModel: viewModel)
    }
}
