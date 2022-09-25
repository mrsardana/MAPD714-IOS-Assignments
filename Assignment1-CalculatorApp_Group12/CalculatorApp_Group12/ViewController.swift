//  Assignment 1 - Calculator App - Part 1 - Create the app UI
//  Group No 12
//  Author's name and StudentID:
//  1. Deepak Sardana
//  Student ID: 301289249
//  2. Khawaja Talha Haseeb
//  Student ID: 301274473
//  3. Muhammad Bilal Dilbar Hussain
//  Student ID: 301205152
//  App description: The User Interface (UI) for the Calculator App. It consists of standard operator buttons (add, subtract, multiply and divide), number keys (0 to 9), a Clear button (AC), the decimal button (.), an equals (=) button, a backspace button (<-), the plus/minus button (+/-) and the percent button ( % ). Calculations are displayed in a UILabel. We have created equals button (=) bigger in size as compared to other buttons in Design.
//  Last Updated 25 September 2022
//  Xcode Version : Version 14.0 (14A309)

import UIKit

class ViewController: UIViewController
{
    // Result Label
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Event Handlers
    
    
    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
        
    }
   
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
        var button = sender as UIButton
        ResultLabel.text = button.titleLabel!.text
    }
    
    
    @IBAction func ClearButton_Pressed(_ sender: UIButton)
    {
        
    }
}
