//
//  ViewController.swift
//  Calculatrice
//

import UIKit

enum Operation: String {
    case addition = "+"
    case soustraction = "-"
    case multiplication = "*"
    case division = "/"
}

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    var firstNumber: Int?
    var secondNumber: Int?
    var operation: Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLabels()
    }
    
    private func initLabels() {
        resultLabel.text = nil
        errorLabel.text = nil
    }
    
    private func reinitCalculatrice() {
        //TODO: réinitialiser les valeurs
    }
    
    private func addNumber(_ numberToAdd: Int) {
        errorLabel.text = nil
        
        if operation == nil {
            // TODO
        } else if numberToAdd == 0 {
            // TODO
        } else {
            // TODO
        }
        
        displayOperation()
    }
    
    private func displayOperation() {
        var valueToDisplay: String = ""
        
        if firstNumber != nil {
			// TODO
        }
        if operation != nil {
			// TODO
        }
        if secondNumber != nil {
			// TODO
        }
		
        resultLabel.text = valueToDisplay
    }
    
    private func calculateResult() {
        errorLabel.text = nil
        
        if operation != nil && secondNumber == nil {
            errorLabel.text = "Tu dois saisir un deuxième nombre"
            
        } else {
			// TODO
			
            reinitCalculatrice()
        }
    }

    @IBAction func zeroAction(_ sender: Any) {
        addNumber(0)
    }
    
    @IBAction func oneAction(_ sender: Any) {
        addNumber(1)
    }
    
    @IBAction func twoAction(_ sender: Any) {
        addNumber(2)
    }
    
    @IBAction func threeAction(_ sender: Any) {
        addNumber(3)
    }
    
    @IBAction func fourAction(_ sender: Any) {
        addNumber(4)
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        addNumber(5)
    }
    
    @IBAction func sixAction(_ sender: Any) {
        addNumber(6)
    }
    
    @IBAction func sevenAction(_ sender: Any) {
        addNumber(7)
    }
    
    @IBAction func heightAction(_ sender: Any) {
        addNumber(8)
    }
    
    @IBAction func nineAction(_ sender: Any) {
        addNumber(9)
    }
    
    //TODO: Les operateurs
    
    @IBAction func resultAction(_ sender: Any) {
        calculateResult()
    }

}

