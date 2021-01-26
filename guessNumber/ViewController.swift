//
//  ViewController.swift
//  guessNumber
//
//  Created by Svetlana Fomina on 23.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var topTitleLabelConstr: NSLayoutConstraint!
    
    @IBOutlet weak var middleConstr: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIScreen.main.bounds.height <= 667 {
            topTitleLabelConstr.constant = 70
            middleConstr.constant = 50
        }
    }

    @IBAction func guessButtonPressed(_ sender: Any) {
        
        let randomNumber = String(arc4random_uniform(10))
        let message = ["win": "Congratulation! You're right.",
                       "lose": "OH NO :( It was ",
                       "errorNotInRange": "Your number not in the needed range.",
                       "error": "Please enter the correct number."]
        var userInputInt:Int? = nil
        
        userInputInt = Int(userInput.text!)
        if userInputInt != nil {
            if userInputInt! < 0 || userInputInt! > 9 {
                resultLabel.text = message["errorNotInRange"]
                resultLabel.textColor = UIColor.red
            } else if userInput.text == randomNumber {
                resultLabel.text = message["win"]
                resultLabel.textColor = UIColor.systemGreen
            } else {
                resultLabel.text = message["lose"]! + randomNumber + "."
                resultLabel.textColor = UIColor.red
            }
        } else {
            resultLabel.text = message["error"]
            resultLabel.textColor = UIColor.red
        }
    }
}

