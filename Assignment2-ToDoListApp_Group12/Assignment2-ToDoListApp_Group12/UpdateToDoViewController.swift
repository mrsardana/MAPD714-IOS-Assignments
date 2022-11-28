import UIKit
protocol UpdateToDoViewControllerDelegate
{
    func updateToDoViewController(_ vc: UpdateToDoViewController)
}
class UpdateToDoViewController: UIViewController {

    @IBOutlet weak var ToDoNameTextView: UITextView!
    @IBOutlet weak var ToDoDescriptionTextView: UITextView!
    @IBOutlet weak var dueDateSwitch: UISwitch!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var calender: UIDatePicker!
    
    var todo: ToDoTasks?
    var delegate: UpdateToDoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoNameTextView.layer.cornerRadius = 20
        ToDoNameTextView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        ToDoNameTextView.layer.borderWidth = 2
        ToDoNameTextView.clipsToBounds = true
        
        ToDoDescriptionTextView.layer.cornerRadius = 20
        ToDoDescriptionTextView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        ToDoDescriptionTextView.layer.borderWidth = 2
        ToDoDescriptionTextView.clipsToBounds = true
        
        ToDoNameTextView.text = todo?.title
        ToDoDescriptionTextView.text = todo?.descrption
//        print(todo!.dueDateReq)
        dueDateSwitch.isOn = todo!.dueDateReq
        completedSwitch.isOn = todo!.isCompleted
        if dueDateSwitch.isOn
        {
            calender.isEnabled = true
        }
        
        else
        {
            calender.isEnabled = false
        }
        
        // Converting string date to date
        let isdate = todo!.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let date = dateFormatter.date(from: isdate!)
        calender.date = date!
        
    }
    

    @IBAction func saveButton(_ sender: UIButton)
    {
        
        // Added alert to confirm Update.
        let alert = UIAlertController(
            title: "Are you sure you want to Upadte?",
            message: "",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Yes",
            style: .default,
            handler: {_ in
                self.updateTodo()
                self.delegate?.updateToDoViewController(self)
            })
        alert.addAction(action)
        let action2 = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)

        //        let todo = ToDoTasks()
        //        delegate?.createToDoViewController(self, didCreateTodo: todo)

    }
    
    @IBAction func cancelButton(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: UIButton)
    {
        // Added alert to confirm delete.
        let alert = UIAlertController(
            title: "Are you sure you want to Delete?",
            message: ToDoNameTextView.text,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Yes",
            style: .default,
            handler: {_ in
                self.deleteTodo()
                self.delegate?.updateToDoViewController(self)
            })
        alert.addAction(action)
        let action2 = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
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
    
    func updateTodo()
    {
        todo?.title = ToDoNameTextView.text
        todo?.descrption = ToDoDescriptionTextView.text
        todo?.dueDateReq = dueDateSwitch.isOn
        todo?.isCompleted = completedSwitch.isOn
        
        calender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        var selectedDate = dateFormatter.string(from: calender.date)
        let dateValue = selectedDate
        todo?.date = dateValue
        print("Update Done")
        DataManager.shared.saveContext()
    }
    
    func deleteTodo()
    {
        DataManager.shared.deleteContext(item: todo!)
        print("Delete Done")
        DataManager.shared.saveContext()
    }
    
}
