//
//  UserDefaults.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import Foundation

extension UserDefaults {
    var recondCurrentPrice: [CurrentPrice] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "recondCurrentPrice") else { return [] }
            return (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)) as? [CurrentPrice] ?? []
        }
        set {
            UserDefaults.standard.set(try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false), forKey: "recondCurrentPrice")
        }
    }
}
