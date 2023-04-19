//
//  ReuseViewable.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import Foundation

import UIKit

public protocol ReuseViewable: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseViewable where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        guard let view = NSStringFromClass(self).components(separatedBy: ".").last else {
            fatalError("Could not find nib with identifier: \(self)")
        }
        return view
    }
}

extension UITableView {
    
    public typealias TableViewCellReusable = UITableViewCell & ReuseViewable
    public typealias TableViewCellNibable = TableViewCellReusable & NibLoadableView
    
    public func register<T: TableViewCellReusable>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    public func registerNib<T: TableViewCellNibable>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    public func dequeueReusableCell<T: TableViewCellReusable>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
