//
//  LandingModels.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit

enum LandingModels {
    enum Loading {
        struct Response {
            let isShow: Bool
        }
        struct ViewModel {
            let isShow: Bool
        }
    }
    enum DataCurrentPrice {
        struct Response {
            let data: CurrentPrice
        }
        struct ViewModel {
            let elements: [CurrencyCellElementType]
        }
    }
    enum BitCoinPrice {
        struct Response {
            let rate: String?
        }
        struct ViewModel {
            let bitCoin: String?
        }
    }
}
