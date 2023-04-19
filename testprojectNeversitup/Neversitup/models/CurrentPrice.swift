//
//  CurrentPrice.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import SwiftyJSON

class CurrentPrice: NSObject, NSCoding {
    
    var BPIData: BPI?
    var time: Time?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(BPIData, forKey: "bpi")
        aCoder.encode(time, forKey: "time")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.BPIData = aDecoder.decodeObject(forKey: "bpi") as? BPI
        self.time = aDecoder.decodeObject(forKey: "time") as? Time
    }
    
    init(withJSON json: JSON) {
        super.init()
        parseData(withJSON: json)
    }
    
    func parseData(withJSON json: JSON) {
        BPIData = BPI(withJSON: json["bpi"])
        time = Time(withJSON: json["time"])
    }
}

class Time: NSObject, NSCoding {

    var updated: String = ""
    var updatedISO: String = ""
    var updateduk: String = ""
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(updated, forKey: "updated")
        aCoder.encode(updatedISO, forKey: "updatedISO")
        aCoder.encode(updateduk, forKey: "updateduk")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.updated = aDecoder.decodeObject(forKey: "updated") as? String ?? ""
        self.updatedISO = aDecoder.decodeObject(forKey: "updatedISO") as? String ?? ""
        self.updateduk = aDecoder.decodeObject(forKey: "updateduk") as? String ?? ""
    }

    init(withJSON json: JSON) {
        super.init()
        updated = json["updated"].stringValue
        updatedISO = json["updatedISO"].stringValue
        updateduk = json["updateduk"].stringValue
    }
}

class BPI: NSObject, NSCoding {

    var USD: BPIDetail?
    var GBP: BPIDetail?
    var EUR: BPIDetail?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(USD, forKey: "USD")
        aCoder.encode(GBP, forKey: "GBP")
        aCoder.encode(EUR, forKey: "EUR")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.USD = aDecoder.decodeObject(forKey: "USD") as? BPIDetail
        self.GBP = aDecoder.decodeObject(forKey: "GBP") as? BPIDetail
        self.EUR = aDecoder.decodeObject(forKey: "EUR") as? BPIDetail
    }

    init(withJSON json: JSON) {
        super.init()
        USD = BPIDetail(withJSON: json["USD"])
        GBP = BPIDetail(withJSON: json["GBP"])
        EUR = BPIDetail(withJSON: json["EUR"])
    }
}

class BPIDetail: NSObject, NSCoding {

    var code: String = ""
    var symbol: String = ""
    var rate: String = ""
    var descriptions: String = ""
    var rate_float: Float = 0.0
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(code, forKey: "code")
        aCoder.encode(symbol, forKey: "symbol")
        aCoder.encode(rate, forKey: "rate")
        aCoder.encode(descriptions, forKey: "description")
        aCoder.encode(rate_float, forKey: "rate_float")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.code = aDecoder.decodeObject(forKey: "code") as? String ?? ""
        self.symbol = aDecoder.decodeObject(forKey: "symbol") as? String ?? ""
        self.rate = aDecoder.decodeObject(forKey: "rate") as? String ?? ""
        self.descriptions = aDecoder.decodeObject(forKey: "description") as? String ?? ""
        self.rate_float = aDecoder.decodeFloat(forKey: "rate_float")
    }

    init(withJSON json: JSON) {
        super.init()
        code = json["code"].stringValue
        symbol = json["symbol"].stringValue
        rate = json["rate"].stringValue
        descriptions = json["description"].stringValue
        rate_float = json["rate_float"].floatValue
    }
}
