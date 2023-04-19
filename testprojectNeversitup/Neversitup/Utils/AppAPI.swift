//
//  AppAPI.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import Alamofire
import SwiftyJSON
import Foundation

class AppAPI: NSObject {
    @discardableResult class func fetchCurrentprice(completion: APICompletion? ) -> APIRequest {
        let request = APIRequest()
        request.url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
        request.method = .get
        request.completion = completion
        request.request()
        return request
    }
}
