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
//        dueDateSwitch.isOn =
//        completedSwitch.isOn =
        
    }
    

    @IBAction func saveButton(_ sender: UIButton)
    {
//        let todo = ToDoTasks()
//        delegate?.updateToDoViewController(self, didUpdateTodo: todo)
        delegate?.updateToDoViewController(self)

    }
    
    @IBAction func cancelButton(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func dueDateSwitchChange(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func completedSwitchChange(_ sender: UISwitch)
    {
        
    }
    
    
}
