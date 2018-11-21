//
//  TopScoreModel.swift
//  Opdracht5_galgje
//
//  Created by student on 21/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class TopScoreModel {
    
    func setArrayToUserDefault(arr: [[String]]) {
        UserDefaults.standard.set(arr, forKey: "arrayWinnaars")
    }
    
    func getArrayFromUserDefault() -> [[String]] {
        return UserDefaults.standard.object(forKey:"arrayWinnaars") as? [[String]] ?? [[String]]()
    }
}
