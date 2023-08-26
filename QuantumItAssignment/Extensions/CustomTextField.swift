//
//  CustomTextField.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 25/08/23.
//

import Foundation
import UIKit

// This file is used to get a custom design on text field.
class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 250/255, alpha: 1).cgColor
        
        layer.cornerRadius = 20
    }
}
