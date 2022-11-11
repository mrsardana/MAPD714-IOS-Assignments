import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var ToDoNameTextView: UITextView!
    @IBOutlet weak var ToDoDescriptionTextView: UITextView!
    
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
    }
    

 
}
