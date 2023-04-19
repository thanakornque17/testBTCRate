//
//  RecondPresenter.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit

protocol RecondPresentationLogic {
    func presentLoading(response: RecondModels.Loading.Response)
    func presentCurrentPrice(response: RecondModels.DataCurrentPrice.Response)
}

class RecondPresenter: RecondPresentationLogic {
    
    weak var viewController: RecondDisplayLogic?
    
    func presentLoading(response: RecondModels.Loading.Response) {
        let viewModel = RecondModels.Loading.ViewModel(isShow: response.isShow)
        viewController?.displayLoading(viewModel: viewModel)
    }
    
    func presentCurrentPrice(response: RecondModels.DataCurrentPrice.Response) {
        let dataBuilder = RecondDataBuilder(currentPrice: response.data)
        let viewModel = RecondModels.DataCurrentPrice.ViewModel(elements: dataBuilder.build())
        viewController?.displayCurrentPrice(viewModel: viewModel)
    }
}
