//
//  DSDelegatePV.swift
//  Opdracht5_galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import UIKit

class DSDelegatePV: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    let alfabetTopPickers = ["-", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "Z"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView.tag
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alfabetTopPickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alfabetTopPickers[row]
    }
    
}
