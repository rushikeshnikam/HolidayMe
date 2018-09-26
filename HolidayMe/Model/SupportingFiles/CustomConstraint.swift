//
//  CustomConstraint.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

class CustomConstraint: NSLayoutConstraint {
    @IBInspectable var dynamic: Bool = false
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
        if self.dynamic == true {
            self.constant = getCalculated(self.constant)
        }
    }
}
