//
//  CurrencyDataBuilder.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import Foundation

enum CurrencyCellElementType {
    case bpiDetail(bpiDetail: BPIDetail)
}

class CurrencyDataBuilder {
    
    let currentPrices: CurrentPrice!
    
    init(currentPrice: CurrentPrice) {
        self.currentPrices = currentPrice
    }
    
    func build() -> [CurrencyCellElementType] {
        var elements: [CurrencyCellElementType] = []
        if let bpiDatas = currentPrices.BPIData {
            if let usd = bpiDatas.USD {
                elements.append(.bpiDetail(bpiDetail: usd))
            }
            if let gbp = bpiDatas.GBP {
                elements.append(.bpiDetail(bpiDetail: gbp))
            }
            if let eur = bpiDatas.EUR {
                elements.append(.bpiDetail(bpiDetail: eur))
            }
        }
        return elements
    }
}
