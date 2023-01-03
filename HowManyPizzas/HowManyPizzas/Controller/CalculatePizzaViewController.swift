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
    @IBOutlet weak var NumberOfSlices: UISegmentedControl!
    
    let picker = UIPickerView()
    let pizzaSize = ["32 cm", "42 cm", "50 cm", "72cm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        PizzaSizeTextfield.inputView = picker
        
    }
    
    @IBAction func CalculateButtonPressed(_ sender: Any) {
    }
  
}
// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension CalculatePizzaViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaSize[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PizzaSizeTextfield.text = pizzaSize[row]
        PizzaSizeTextfield.resignFirstResponder()
    }
}
