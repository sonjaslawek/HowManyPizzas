//
//  ResultsViewController.swift
//  HowManyPizzas
//
//  Created by Sonja on 08/01/2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var finishValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(finishValue)
    }
    
    @IBAction func calcAgainButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CalculatePizzaViewController") as! CalculatePizzaViewController
        nextViewController.modalPresentationStyle = .overFullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
}
