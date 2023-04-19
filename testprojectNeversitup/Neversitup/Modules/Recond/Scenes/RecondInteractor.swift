//
//  RecondInteractor.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import Foundation

protocol RecondBusinessLogic {
    func fetchCurrentPrice()
}

class RecondInteractor: RecondBusinessLogic {
    
    var presenter: RecondPresentationLogic?
    
    func fetchCurrentPrice() {
        presenter?.presentLoading(response: RecondModels.Loading.Response(isShow: true))
        var recondCurrentPrice = UserDefaults.standard.recondCurrentPrice
        let response = RecondModels.DataCurrentPrice.Response(data: recondCurrentPrice)
        presenter?.presentCurrentPrice(response: response)
        presenter?.presentLoading(response: RecondModels.Loading.Response(isShow: false))
    }
}

