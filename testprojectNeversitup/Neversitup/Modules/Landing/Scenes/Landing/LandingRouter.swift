//
//  LandingRouter.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit

protocol LandingRoutingLogic {
    func navigateToRecondScreen()
}

class LandingRouter: NSObject, LandingRoutingLogic {
    
    weak var viewController: LandingViewController?
    
    func navigateToRecondScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Recond", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RecondViewController") as! RecondViewController
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }
}
