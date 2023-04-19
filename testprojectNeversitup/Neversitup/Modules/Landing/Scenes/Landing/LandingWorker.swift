//
//  LandingWorker.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit
import Foundation
import Alamofire

protocol LandingFetcherType {
    func fetchCurrentprice(completion: @escaping (CurrentPrice?) -> Void)
}

class LandingWorker: LandingFetcherType {
    
    func fetchCurrentprice(completion: @escaping (CurrentPrice?) -> Void) {
        AppAPI.fetchCurrentprice() { (response) in
            if let json = response.data {
                let data = CurrentPrice(withJSON: json)
                completion(data)
            } else {
                completion(nil)
            }
        }
    }
}
