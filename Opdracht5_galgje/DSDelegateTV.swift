//
//  DSDelegateTV.swift
//  Opdracht5_galgje
//
//  Created by student on 15/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import UIKit

class DSDelegateTV: NSObject, UITableViewDataSource {
    let data =  UserDefaults.standard.dictionaryRepresentation()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
}
