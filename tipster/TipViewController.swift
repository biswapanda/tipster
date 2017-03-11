//
//  ViewController.swift
//  tipster
//
//  Created by bis on 2/23/17.
//  Copyright © 2017 bis. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billAmountTextField.becomeFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tipPercentIndex = UserDefaults.standard.integer(forKey: "default_tip_percent_index")
        tipPercentSegmentedControl.selectedSegmentIndex = tipPercentIndex
        let billAmount = UserDefaults.standard.double(forKey: "last_bill_amount")
        if billAmount != 0 {
            let billAmountText = String(format:"%.2f", billAmount)
                .replacingOccurrences(of: ".00", with: "")
            billAmountTextField.text = billAmountText
        }
        self.calculateTip(0)
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
        UserDefaults.standard.set(bill, forKey:"last_bill_amount")
        UserDefaults.standard.synchronize()
        UIView.animate(
            withDuration: 0.3,
            animations: {
                if (bill == 0) {
                    self.resultView.alpha = 0
                } else {
                    self.resultView.alpha = 1
                }})
        let tip = bill * Double(tipPercentForIndex[tipPercentSegmentedControl.selectedSegmentIndex]!) / 100.0
        let total = bill + tip
        totalAmountLabel.text = String(format:"%.2f", total);
        tipLabel.text = String(format:"%.2f", tip);
    }
}

