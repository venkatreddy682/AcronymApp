//
//  AcronymsTableCell.swift
//  SystemTest
//
//  Created by apple on 10/06/22.
//

import UIKit

class AcronymsTableCell: UITableViewCell {
    
    @IBOutlet weak var lblAbbreviationName: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    
    func setAcronymsData(data:Abbreviation , indexpath:IndexPath) {
        lblAbbreviationName.text = data.lf
        lblYear.text = String(data.since ?? 0)
    }
}
