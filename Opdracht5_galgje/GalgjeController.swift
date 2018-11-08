//
//  GalgjeController.swift
//  Opdracht5_galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class GalgjeController {
    var gekozenWoord: String
    
    init() {
        gekozenWoord = ""
    }
    
    func checkInput(_ text: String) -> String {
        let trimmedText = text.trimmingCharacters(in: .whitespaces);
        if(trimmedText.count < 6 || trimmedText.count > 6) {
            return "Het woord moet uit precies 6 letters bestaan"
        }
        else {
            gekozenWoord = trimmedText
            return ""
        }
    }
}
