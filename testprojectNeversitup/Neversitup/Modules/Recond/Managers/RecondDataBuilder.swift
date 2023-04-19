//
//  RecondDataBuilder.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import Foundation

enum RecondCellElementType {
    case currentPrice(currentPrice: CurrentPrice)
}

class RecondDataBuilder {
    
    let currentPrices: [CurrentPrice]!
    
    init(currentPrice: [CurrentPrice]) {
        self.currentPrices = currentPrice
    }
    
    func build() -> [RecondCellElementType] {
        var elements: [RecondCellElementType] = []
        for data in currentPrices {
            elements.append(.currentPrice(currentPrice: data))
        }
        return elements
    }
}
