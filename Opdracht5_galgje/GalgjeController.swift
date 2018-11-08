//
//  GalgjeController.swift
//  Opdracht5_galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class GalgjeController {
    var chosenWord: String
    var chosenWordArray: Array<Character>
    var numberOfTries: Int
    var discoveredWord: String
    var discoveredWordArray: Array<Character>
    
    init() {
        chosenWord = ""
        numberOfTries = 0
        chosenWordArray = []
        discoveredWord = ""
        discoveredWordArray = []
    }
    
    func checkInput(_ text: String) -> String {
        let trimmedText = text.trimmingCharacters(in: .whitespaces);
        if(trimmedText.count < 6 || trimmedText.count > 6) {
            return "Het woord moet uit precies 6 letters bestaan"
        }
        else {
            chosenWord = trimmedText
            setChosenWordInArray()
            return ""
        }
    }
    
    func setChosenWordInArray() {
        chosenWordArray = Array(chosenWord)
        discoveredWordArray = ["-", "-", "-", "-", "-", "-"]
    }
    
    func tryLetter(letter: Character) {
        var i = 0
        for l in chosenWordArray {
            if(l == letter) {
                discoveredWordArray[i] = l
            }
            i = i + 1
        }
        setDiscoveredWordArrayToString()
        addTry()
    }
    
    func addTry() {
        numberOfTries = numberOfTries + 1
    }
    
    func setDiscoveredWordArrayToString () -> String 
    
}
