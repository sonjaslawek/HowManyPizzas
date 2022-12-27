//
//  ViewController.swift
//  HowManyPizzas
//
//  Created by Sonja on 22/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func StartButton(_ sender: Any) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CalculatePizzaViewController") as! CalculatePizzaViewController
        self.present(nextViewController, animated: true, completion: nil)
    
    }
    
}

