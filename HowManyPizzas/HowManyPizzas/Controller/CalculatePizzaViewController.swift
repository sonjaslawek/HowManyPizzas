//
//  CalculatePizzaViewController.swift
//  HowManyPizzas
//
//  Created by Sonja on 27/12/2022.
//

import UIKit

class CalculatePizzaViewController: UIViewController {
    
    
    @IBOutlet weak var PizzaSizeTextfield: UITextField!
    @IBOutlet weak var NumberOfPeopleTextField: UITextField!
 
    
    let picker = UIPickerView()
    let pizzaSize = ["32", "42", "50", "72"]
    var peopleForPizza: Int {
        get {
            guard let people = Int(NumberOfPeopleTextField.text!) else {
                fatalError("Nothing was writen")
            }
            return people
        }
    }
    var pizzaSlices = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        NumberOfPeopleTextField.delegate = self
        PizzaSizeTextfield.inputView = picker
        
    }
    
    @IBAction func numberOfSlices(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pizzaSlices = 1
        case 1:
            pizzaSlices = 2
        case 2:
            pizzaSlices = 3
        case 3:
            pizzaSlices = 4
        case 4:
            pizzaSlices = 5
        case 5:
            pizzaSlices = 6
        default:
            print("User not choose anything :(")
        }
    }
    
    @IBAction func CalculateButtonPressed(_ sender: Any) {
       
        if peopleForPizza < 20 {
            return
        } else {
            let alert = UIAlertController(title: "Are you sure?", message: "You have too much people to your order!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }

    }
    
}
    
// MARK: - UIPickerViewDataSource, UIPickerViewDelegate Methods
extension CalculatePizzaViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pizzaSize[row]) cm"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PizzaSizeTextfield.text = "\(pizzaSize[row]) cm"
        PizzaSizeTextfield.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate Method
extension CalculatePizzaViewController: UITextFieldDelegate {
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NumberOfPeopleTextField.text = ""
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxCharacters = 3
        let currentNumber: NSString = textField.text! as NSString
        let newNumber: NSString = currentNumber.replacingCharacters(in: range, with: string) as NSString
        if newNumber.length == maxCharacters {
            textField.resignFirstResponder()
        }
        return newNumber.length <= maxCharacters
    }
  
}
