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
    
    @IBOutlet weak var IMG_try: UIImageView!
    
    @IBOutlet weak var TXT_try: UITextView!
    
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
        
        alert.addAction(UIAlertAction(title: "Bewaar", style: .default, handler: {(action: UIAlertAction!) in self.checkInputWord(text: textField.text?.uppercased() ?? "")} ))
        
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
            IMG_playGame.isUserInteractionEnabled = false
        }
    }
    
    func changePictureTry() {
        let i = galgjeController.getNumberOfTries()
        if(i <= 11) {
            IMG_try.image = UIImage(named: "galgje" + String(i))
        }
        if(i == 11) {
            LB_fault.text = "Je beurten zijn op, start een nieuw spel en probeer opnieuw! Je hebt het spel verloren in " +  String(galgjeController.getNumberOfTries()) + " beurten"
            BTN_playTurn.isUserInteractionEnabled = false
            PV_letterInsert.isUserInteractionEnabled = false
            IMG_playGame.isUserInteractionEnabled = true
        }
        
        
        
    }
    
    @IBAction func clickButtonPlayTurn(_ sender: Any) {
        let alfabetTopPickers = ["-", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "Z"]
        
        if let delegate = PV_letterInsert.delegate {
            
            let selectedValue = delegate.pickerView!(PV_letterInsert, titleForRow: PV_letterInsert.selectedRow(inComponent: 0), forComponent: 0) ?? ""
            
            if(selectedValue == "-") {
                LB_fault.text = "Geef een waarde verschillend van '-' in."
            }
            else {
                let result = galgjeController.tryLetter(letter: Character(selectedValue))
                
                if(result == true) {
                    var i = 0
                    for var v in galgjeController.getDiscoveredWordArray() {
                        let row: Int = alfabetTopPickers.firstIndex(of: String(v)) ?? 0
                        PV_letters.selectRow(row, inComponent: i, animated: true)
                        i = i + 1
                    }
                    
                    if(galgjeController.spelGewonnen() == true) {
                        LB_fault.text = "Je hebt het spel gewonnen, proficiat! Je hebt het spel uitgespeeld in " +  String(galgjeController.getNumberOfTries()) + " beurten"
                        BTN_playTurn.isUserInteractionEnabled = false
                        PV_letterInsert.isUserInteractionEnabled = false
                        IMG_playGame.isUserInteractionEnabled = true
                    }
                    
                }
                else{
                    changePictureTry()
                }
                
                setNewLine()
            }
        }
        
        
    }
    
    func setNewLine() {
        let arr = galgjeController.getDiscoveredWordArray()
        var str = ""
        for var a in arr {
            if(str != "") {
                str = str + " " + String(a)
            }
            else {
                str = str + String(a)
            }
            
        }
        
        TXT_try.text = str + "\n" + TXT_try.text
    }
    
}
