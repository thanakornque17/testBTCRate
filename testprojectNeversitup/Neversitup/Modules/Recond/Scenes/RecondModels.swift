//
//  RecondModels.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit

enum RecondModels {
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
            let data: [CurrentPrice]
        }
        struct ViewModel {
            let elements: [RecondCellElementType]
        }
    }
}
