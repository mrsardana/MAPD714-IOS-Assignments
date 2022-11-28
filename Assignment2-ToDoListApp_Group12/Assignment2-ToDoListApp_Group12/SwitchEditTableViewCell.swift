import UIKit
import Foundation

protocol SwitchEditTableViewCellDelegate: AnyObject
{
    func checkTableViewCell(_ cell:SwitchEditTableViewCell, didChangeSwitchState on: Bool)
}

class SwitchEditTableViewCell: UITableViewCell
{
    weak var delegate:SwitchEditTableViewCellDelegate?
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBAction func EditButton(_ sender: UIButton)
    {
        
    }
    @IBOutlet weak var Switch: UISwitch!
    
    @IBAction func SwitchChange(_ sender: UISwitch)
    {
        updateComplete()
        delegate?.checkTableViewCell(self, didChangeSwitchState: Switch.isOn)
    }
    

    func set(title: String, date: String, iscompleted:Bool, dueDateReq:Bool)
    {

        if dueDateReq
        {
            DateLabel.text = date
        }
        else
        {
            DateLabel.text = ""
        }
        Label.text = title
        Switch.isOn = iscompleted
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
            attributeString.addAttribute(.strikethroughStyle,value: 0, range: NSMakeRange(0, attributeString.length))
            Label.textColor = UIColor.black
            
        }
        Label.attributedText=attributeString
    }
}
