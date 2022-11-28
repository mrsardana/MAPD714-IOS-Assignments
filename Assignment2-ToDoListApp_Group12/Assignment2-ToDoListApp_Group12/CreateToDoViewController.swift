import UIKit
import Foundation

protocol CreateToDoViewControllerDelegate
{
    func createToDoViewController(_ vc: CreateToDoViewController)
}

class CreateToDoViewController: UIViewController {
    @IBOutlet weak var ToDoNameTextView: UITextView!
    @IBOutlet weak var ToDoDescriptionTextView: UITextView!
    
    var todo: ToDoTasks?
    var delegate: CreateToDoViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ToDoNameTextView.layer.cornerRadius = 20
        ToDoNameTextView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        ToDoNameTextView.layer.borderWidth = 2
        ToDoNameTextView.clipsToBounds = true
        
        ToDoDescriptionTextView.layer.cornerRadius = 20
        ToDoDescriptionTextView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        ToDoDescriptionTextView.layer.borderWidth = 2
        ToDoDescriptionTextView.clipsToBounds = true
        
        dueDateSwitch.isOn = false
        completedSwitch.isOn = false
        calender.isEnabled = false
    }
    

    @IBAction func createNewButton(_ sender: UIButton)
    {
        guard let toDoTitle = ToDoNameTextView.text else {
            print("Invalid Title")
            return
        }
        guard let toDoDescription = ToDoDescriptionTextView.text else {
            print("Invalid Description")
            return
        }
        
        let dueDate = dueDateSwitch.isOn
        let isCompelte = completedSwitch.isOn
        
        calender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        var selectedDate = dateFormatter.string(from: calender.date)
 
        let dateValue = selectedDate
        
        ToDoNameTextView.text = ""
        ToDoDescriptionTextView.text = ""
        dueDateSwitch.isOn = false
        completedSwitch.isOn = false
        
        // Save new created toDo task
        let toDo = DataManager.shared.toDoTasks(title: toDoTitle, descrption: toDoDescription, date: dateValue, dueDateReq: dueDate, isCompleted: isCompelte)
        print("Created")
        DataManager.shared.saveContext()
        
//        let todo = ToDoTasks()
//        delegate?.createToDoViewController(self, didCreateTodo: todo)
        
        delegate?.createToDoViewController(self)
//        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var dueDateSwitch: UISwitch!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    @IBOutlet weak var calender: UIDatePicker!
    
    @IBAction func calenderDateSelect(_ sender: UIDatePicker)
    {

    }
    @IBAction func dueDateSwitchChange(_ sender: UISwitch)
    {
        if dueDateSwitch.isOn
        {
            calender.isEnabled = true
        }
        
        else
        {
            calender.isEnabled = false
        }
   
    }
    
    @IBAction func completedSwitchChange(_ sender: UISwitch)
    {
        
    }
    
    
}
