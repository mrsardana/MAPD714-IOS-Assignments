//  Assignment 2 - ToDoListApp - Part 1 – UI Design
//  Group No 12
//  Author's name and StudentID:
//  1. Deepak Sardana
//  Student ID: 301289249
//  2. Khawaja Talha Haseeb
//  Student ID: 301274473
//  3. Muhammad Bilal Dilbar Hussain
//  Student ID: 301205152
//  App description: This is first part of App. Using Xcode, latest version of iOS SDK and the Swift programming language, we have created a To Do List app. In this part, we created the User Interface for the Todo List App. The app interface will allow the user to create a list of Todos on the main screen. We also included a another screen that displays the Todo Details.
//  Last Updated 11 November, 2022
//  Xcode Version : Version 14.1 (14B47b)


import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var ToDoListTabelView: UITableView!
    
    let myList = [ToDoList(name:"Meeting 1", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 2", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 3", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 4", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 5", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 6", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 7", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 8", date: "14 Nov 2022"),
                  ToDoList(name:"Meeting 9", date: "14 Nov 2022")
    ]
    
    let myListIdentifier = "MyListIdentifier"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ToDoListTabelView.separatorStyle = .none
        ToDoListTabelView.showsVerticalScrollIndicator = false
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
               
        cell.set(name: todo.name, date : todo.date ,isComplete: todo.isComplete)
        cell.layer.cornerRadius = 40
        cell.layer.borderWidth = 2
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor(red: 0, green: 0,  blue: 0, alpha: 0.5).cgColor
        return cell
    }


}

