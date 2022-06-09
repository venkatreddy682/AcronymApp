//
//  AcronymModel.swift
//  SystemTest
//
//  Created by apple on 09/06/22.
//

import Foundation


struct AcronymModel: Codable {
    var lfs: [Abbreviation]?
}
struct Abbreviation: Codable {
    var lf: String?
    var freq:Int?
    var since: Int?
    
}
