//
//  ViewController.swift
//  Opdracht5_galgje
//
//  Created by student on 18/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PV_letters: UIPickerView!
    
    @IBOutlet weak var PV_letterInsert: UIPickerView!
    
    @IBOutlet weak var BTN_playTurn: UIButton!
    
    @IBOutlet weak var LB_fault: UILabel!
    
    @IBOutlet weak var IMG_playGame: UIImageView!
    
    var galgjeController = GalgjeController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        PV_letters.isUserInteractionEnabled = false
        BTN_playTurn.isUserInteractionEnabled = false
        PV_letterInsert.isUserInteractionEnabled = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        IMG_playGame.isUserInteractionEnabled = true
        IMG_playGame.addGestureRecognizer(tapGestureRecognizer)
        
        PV_letters.tag = 6
        PV_letterInsert.tag = 1
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        setWordAlert()
    }
    
    func setWordAlert() {
        let alert = UIAlertController(title: "GALGJE", message: "Geef een woord van 6 letters!", preferredStyle: .alert)
        alert.addTextField{textField in textField.placeholder = "Bv: galgje"}
        alert.addAction(UIAlertAction(title: "Annuleer", style: .cancel, handler: {(action: UIAlertAction!) in self.LB_fault.text = ""} ))
        
        let textField = alert.textFields![0]
        
        alert.addAction(UIAlertAction(title: "Bewaar", style: .default, handler: {(action: UIAlertAction!) in self.checkInputWord(text: textField.text ?? "")} ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkInputWord(text: String){
        LB_fault.text = ""
        if(galgjeController.checkInput(text) != "") {
            LB_fault.text = galgjeController.checkInput(text)
        }
        else {
            BTN_playTurn.isUserInteractionEnabled = true
            PV_letterInsert.isUserInteractionEnabled = true
        }
    }
    
    


}

