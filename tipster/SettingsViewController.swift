//
//  SettingsViewController.swift
//  tipster
//
//  Created by bis on 2/24/17.
//  Copyright © 2017 bis. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipPercentIndex = UserDefaults.standard.integer(forKey: "default_tip_percent_index")
        tipPercentSegmentedControl.selectedSegmentIndex = tipPercentIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tipPercentChanged(_ sender: Any) {
        let tipPercentIndex = tipPercentSegmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(tipPercentIndex, forKey: "default_tip_percent_index")
        UserDefaults.standard.synchronize()
    }
}
