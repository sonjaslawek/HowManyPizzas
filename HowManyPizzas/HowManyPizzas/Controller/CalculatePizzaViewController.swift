//
//  CalculatePizzaViewController.swift
//  HowManyPizzas
//
//  Created by Sonja on 27/12/2022.
//

import UIKit

class CalculatePizzaViewController: UIViewController {
    
    @IBOutlet weak var pizzaSizeTextfield: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    let picker = UIPickerView()
    var pizzaSizes = [32, 42, 50, 72]
    var endNumbersOfPeople: Int {
        get {
            guard let peopleTextfield = numberOfPeopleTextField.text, let people = Int(peopleTextfield)
            else {
                fatalError()
            }
            return people
        }
    }
    
    private var model = PizzaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        numberOfPeopleTextField.delegate = self
        pizzaSizeTextfield.inputView = picker
        
    }
    
    @IBAction func numberOfSlices(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            model.pizzaSlices = 1
        case 1:
            model.pizzaSlices = 2
        case 2:
            model.pizzaSlices = 3
        case 3:
            model.pizzaSlices = 4
        case 4:
            model.pizzaSlices = 5
        case 5:
            model.pizzaSlices = 6
        default:
            print("User not choose anything :(")
        }
    }
    
    @IBAction func CalculateButtonPressed(_ sender: Any) {
        model.peopleForPizza = endNumbersOfPeople
        
        if endNumbersOfPeople < 20 {
            let results = calculatePizzas()
        } else {
            let alert = UIAlertController(title: "Are you sure?", message: "You have too much people to your order!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func calculatePizzas() -> Int {
        let cmToInches = Double(model.pizzaSize) / 2.54
        let slices = cmToInches - 4
        let numberOfPizzas = (Double(model.peopleForPizza) * Double(model.pizzaSlices) / slices)
        let finishValue = Int(ceil(numberOfPizzas))
        
        return finishValue
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate Methods
extension CalculatePizzaViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaSizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pizzaSizes[row]) cm"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pizzaSizeTextfield.text = "\(pizzaSizes[row]) cm"
        model.pizzaSize = pizzaSizes[row]
        pizzaSizeTextfield.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate Method
extension CalculatePizzaViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        numberOfPeopleTextField.text = ""
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
