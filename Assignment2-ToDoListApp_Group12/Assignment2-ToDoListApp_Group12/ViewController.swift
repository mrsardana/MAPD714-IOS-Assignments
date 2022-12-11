//  Assignment 2 - ToDoListApp - Part 3 – Gesture Control
//  Group No 12
//  Author's name and StudentID:
//  1. Deepak Sardana
//  Student ID: 301289249
//  2. Khawaja Talha Haseeb
//  Student ID: 301274473
//  3. Muhammad Bilal Dilbar Hussain
//  Student ID: 301205152
//  App description: This is third part of App. Using Xcode, latest version of iOS SDK and the Swift programming language, we have created a To Do List app. In this part, we have modify the User Interface (UI) and logic to perform Gesture Control. Now By using this app user can update, delete the old created tasks using gestures.
//  Last Updated 11 December, 2022
//  Xcode Version : Version 14.1 (14B47b)


import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    static let shared = ViewController()
    
    @IBOutlet weak var ToDoListTabelView: UITableView!
    
    var myList: [ToDoTasks] = []
    
    let myListIdentifier = "MyListIdentifier"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ToDoListTabelView.separatorStyle = .none
        ToDoListTabelView.showsVerticalScrollIndicator = false
        myList = DataManager.shared.toDos()
        ToDoListTabelView.reloadData()
        
    }
    
    @IBAction func createNewButton(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if  segue.identifier == "EditItem"
        {
            print("Inside edit")
            let controller = segue.destination as! UpdateToDoViewController
            controller.delegate = self
            controller.todo = sender as? ToDoTasks
        }
        
    }
    
    // Swipe left to right method
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let update = UIContextualAction(style: .normal, title: "Update")
        {
            action, view , update in
            print("Update")
            self.performSegue(withIdentifier: "EditItem", sender:self.myList[indexPath.section])
            update(false)
        }
        update.backgroundColor = UIColor(red: 0, green: 0,  blue: 1, alpha: 0.5)
        return UISwipeActionsConfiguration(actions: [update])
    }
    
    // Swipe right to left method
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
            let complete = UIContextualAction(style: .destructive, title: "Complete"){
            action, view , complete in
            let todo = self.myList[indexPath.section].isCompleted
            let updatetodo = todo == true ? false: true
            let todos = self.myList[indexPath.section]
            todos.isCompleted = updatetodo
            DataManager.shared.saveContext()
            print("Compeled Change")
            self.ToDoListTabelView.reloadData()
            complete(false)
        }
        complete.backgroundColor = UIColor(red: 1, green: 1,  blue: 0, alpha: 0.65)
        
        let delete = UIContextualAction(style: .destructive, title: "Delete"){
            action, view , delete in
            let todo = self.myList[indexPath.section]
            DataManager.shared.deleteContext(item: todo)
            print("Delete Done")
            DataManager.shared.saveContext()
            self.myList = DataManager.shared.toDos()
            self.ToDoListTabelView.reloadData()
            delete(false)
        }
        delete.backgroundColor = UIColor(red: 1, green: 0,  blue: 0, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [delete, complete])
    }
    
    // Creating sections of mylist records counts
    func numberOfSections(in tableView: UITableView) -> Int {
        return myList.count
    }
    
    // Creating 1 row for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    // Giving height to the row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 79
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    // Set the spacing between sections
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0.5
       }
    
    // Creating cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: myListIdentifier, for : indexPath) as! SwitchEditTableViewCell
        cell.delegate = self
        let todo = myList[indexPath.section]
//        print(todo.date!)
        cell.set(title: todo.title!, date : todo.date!, iscompleted: todo.isCompleted, dueDateReq:todo.dueDateReq)
//        cell.layer.cornerRadius = 40
//        cell.layer.borderWidth = 2
//        cell.clipsToBounds = true
//        cell.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor(red: 0, green: 0,  blue: 0, alpha: 0.5).cgColor
        return cell
    }
    

    // Segue action to Create new todo task
    @IBSegueAction func createViewController(_ coder: NSCoder) -> CreateToDoViewController?
    {
        let vc = CreateToDoViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
    
//    @IBSegueAction func updateViewController(_ coder: NSCoder) -> UpdateToDoViewController?
//    {
//        let vc = UpdateToDoViewController(coder: coder)
//        if let indexpath = ToDoListTabelView.indexPathForSelectedRow
//        {
//            let todo = myList[indexpath.section]
//            vc?.todo = todo
////            print(todo.dueDateReq)
//        }
//
//        vc?.delegate = self
//        return vc
//    }
}


extension ViewController: CreateToDoViewControllerDelegate
{
    func createToDoViewController(_ vc: CreateToDoViewController)
    {
        myList = DataManager.shared.toDos()
        ToDoListTabelView.reloadData()
        dismiss(animated: true, completion: nil)
    }

}


extension ViewController: UpdateToDoViewControllerDelegate
{
    func updateToDoViewController(_ vc: UpdateToDoViewController)
    {
        if let indexPath = ToDoListTabelView.indexPathForSelectedRow
        {
            // Update
//            myList[indexPath.section] = todo
            myList = DataManager.shared.toDos()
            ToDoListTabelView.reloadData()
        }
        else
        {
            myList = DataManager.shared.toDos()
            ToDoListTabelView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }

}

extension ViewController:SwitchEditTableViewCellDelegate
{
    func checkTableViewCell(_ cell: SwitchEditTableViewCell, didChangeSwitchState on: Bool)
    {
        guard let indexPath = ToDoListTabelView.indexPath(for: cell) else {
            return
        }
        let todo = myList[indexPath.section]
        todo.isCompleted = on
        print("Compeled Change")
        DataManager.shared.saveContext()
        
    }
}
