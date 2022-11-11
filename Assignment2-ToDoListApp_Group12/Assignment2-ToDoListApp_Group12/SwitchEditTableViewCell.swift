 import UIKit

class SwitchEditTableViewCell: UITableViewCell
{
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBAction func EditButton(_ sender: UIButton)
    {
        
    }
    @IBOutlet weak var Switch: UISwitch!
    
    @IBAction func SwitchChange(_ sender: UISwitch)
    {
        updateComplete()
    }
    

    func set(name: String, date:String, isComplete: Bool)
    {
        Label.text = name
        DateLabel.text = date
        Switch.isOn = isComplete
        updateComplete()
    }
    
    private func updateComplete(){
        let attributeString = NSMutableAttributedString(string:Label.text!)
        
        if Switch.isOn
        {
            attributeString.addAttribute(.strikethroughStyle,value: 1, range: NSMakeRange(0, attributeString.length))
            Label.textColor = UIColor(red: 0.239, green: 0.4196,  blue: 0.031372, alpha: 1)
            
        }
        else
        {
            attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
            Label.textColor = UIColor.black
            
        }
        Label.attributedText=attributeString
    }
}
