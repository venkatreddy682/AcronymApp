//
//  AcronymViewModel.swift
//  SystemTest
//
//  Created by apple on 09/06/22.
//

import Foundation
import UIKit

class AcronymViewModel {

    func callgetAcronymsAPI(params: String, delegate:UIViewController?, completionHandler: @escaping (_ responseArray:[Abbreviation]?,_ error:Error?)->Void) {
        NetWorkManager.shared.initiateServiceCall(SERVICE_BASE_URL, params, GET_REQUEST, delegate) { responseObj, error in
            if error == nil {
                if let acronymsDataObj = responseObj as? [AcronymModel] {
                    completionHandler(acronymsDataObj.first?.lfs,error)
                }
            }
        }
    }
}
