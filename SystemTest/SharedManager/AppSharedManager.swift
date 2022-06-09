//
//  AppSharedManager.swift
//  SystemTest
//
//  Created by apple on 09/06/22.
//

import UIKit

class AppSharedManager: NSObject {

    static let sharedManager:AppSharedManager = {
        let instance = AppSharedManager()
        return instance
    }()
}

extension AppSharedManager {
    
    class func presentationAlert(title: String?, message: String?, addButtons: NSArray?, viewController: UIViewController?, completionHandler: @escaping (_ alertView: UIAlertController?, _ alertAction: UIAlertAction?) -> Void)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for btnTitle in addButtons ?? [] {
            let btnAction = UIAlertAction(title: btnTitle as? String, style: UIAlertAction.Style.default, handler: { alert -> Void in
                DispatchQueue.main.async(execute: {() -> Void in
                    completionHandler(alertController, alert)
                })
            })
            alertController.addAction(btnAction)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            if viewController == nil {
                let vc = APPDELEGATE?.window?.rootViewController
                 vc?.present(alertController, animated: true, completion: nil)
            } else {
                viewController?.present(alertController, animated: true, completion: nil)
            }
        })
    }
}
