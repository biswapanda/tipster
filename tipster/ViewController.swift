//
//  ViewController.swift
//  tipster
//
//  Created by bis on 2/23/17.
//  Copyright © 2017 bis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentForIndex = [0: 10, 1: 15, 2: 20]
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * Double(tipPercentForIndex[tipPercentSegmentedControl.selectedSegmentIndex]!) / 100.0
        let total = bill + tip
        totalAmountLabel.text = String(format:"%.2f", total);
        tipLabel.text = String(format:"%.2f", tip);
    }
}

