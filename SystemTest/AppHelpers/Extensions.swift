//
//  Extensions.swift
//  SystemTest
//
//  Created by apple on 09/06/22.
//

import UIKit

extension UITableView {
    func setNoDataPlaceholder(_ message: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        label.text = message
        label.textAlignment = .center
        label.font = UIFont(name: FONT_NAME, size: 18)
        label.sizeToFit()
        self.backgroundView = label
    }
}

extension NSObject {
    var className: String {
        String(describing: type(of: self))
    }
    
    class var className: String {
        String(describing: self)
    }
}
