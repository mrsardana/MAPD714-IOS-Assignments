//
//  ViewController.swift
//  Assignment2-ToDoListApp_Group12
//
//  Created by Deepak Sardana on 2022-11-09.
//

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 79
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    // Set the spacing between sections
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0.5
       }
    
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

