//
//  ResultsViewController.swift
//  HowManyPizzas
//
//  Created by Sonja on 08/01/2023.
//

import UIKit

protocol ResultsViewDelegate: class {
    func clearData()
}

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    weak var delegate: ResultsViewDelegate?
    
    var finishValue = Int()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(finishValue)
    }
    
    @IBAction func calcAgainButton(_ sender: Any) {
        
        delegate?.clearData()
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    

}
