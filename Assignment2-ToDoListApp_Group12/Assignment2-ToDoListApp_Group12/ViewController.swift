//  Assignment 2 - ToDoListApp - Part 2 – Adding Logic for Data Persistence
//  Group No 12
//  Author's name and StudentID:
//  1. Deepak Sardana
//  Student ID: 301289249
//  2. Khawaja Talha Haseeb
//  Student ID: 301274473
//  3. Muhammad Bilal Dilbar Hussain
//  Student ID: 301205152
//  App description: This is second part of App. Using Xcode, latest version of iOS SDK and the Swift programming language, we have created a To Do List app. In this part, we have added the logic that powers the User Interface (UI) for the Todo App. We have used Core Date to save the data. By using this app user can create new todo task also user can update the old created tasks.
//  Last Updated 27 November, 2022
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
        let todo = myList[indexPath.section]
        
//        print(todo.date!)
        cell.set(title: todo.title!, date : todo.date!, isCompleted: todo.isCompleted, dueDateReq:todo.dueDateReq)
        cell.layer.cornerRadius = 40
        cell.layer.borderWidth = 2
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor(red: 0, green: 0,  blue: 0, alpha: 0.5).cgColor
        return cell
    }
    
    @IBSegueAction func createViewController(_ coder: NSCoder) -> CreateToDoViewController?
    {
        let vc = CreateToDoViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
    
    @IBSegueAction func updateViewController(_ coder: NSCoder) -> UpdateToDoViewController?
    {
        let vc = UpdateToDoViewController(coder: coder)
        if let indexpath = ToDoListTabelView.indexPathForSelectedRow
        {
            let todo = myList[indexpath.section]
            vc?.todo = todo
//            print(todo)
        }
        
        vc?.delegate = self
        return vc
    }
    
}


extension ViewController: CreateToDoViewControllerDelegate
{
    func createToDoViewController(_ vc: CreateToDoViewController)
    {
        print("Creation Done")
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
            //Nothing
        }
        print("Update Done")
        dismiss(animated: true, completion: nil)
    }

}
