//
//  TodoTableViewController.swift
//  TodoApp_v2
//
//  Created by Hajar Alomari on 15/12/2021.
//

import UIKit


let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var todoList: [Todo] = []
class TodoTableViewController: UITableViewController, TaskDelegate, UINavigationControllerDelegate {
    
    var index: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
       
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskTableViewCell
        let item = todoList[indexPath.row]
        
        cell.setTask(title: item.title! , details: item.details!, date: item.dueDate!, isChecked: item.isChecked)

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            context.delete(todoList[indexPath.row])
            do{
               try context.save()
            }catch{
                print("Failed to delete task")
            }
            fetchData()
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item  = todoList[indexPath.row]
        item.isChecked.toggle()
        do{
            try context.save()
            fetchData()
        }catch{
            print("Failed to update data")
        }
      
    }
 
    // add update function
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditTask", sender: indexPath)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UINavigationController
        if let addVC = (vc.topViewController as? AddViewController){
            if (sender as? UIBarButtonItem) != nil {
                addVC.delegate = self
            } else if let index = sender as? IndexPath{
                addVC.delegate = self
                addVC.indexPath = index as NSIndexPath
                addVC.titleName = todoList[index.row].title
                addVC.details = todoList[index.row].details
                addVC.date = todoList[index.row].dueDate
            }
        }
            
    }
    
    
    
    //MARK: CoreDate
    
    func fetchData() {
        do{
            todoList = try context.fetch(Todo.fetchRequest())
            tableView.reloadData()
        }catch{
            print("Failed to fetch Data")
        }
    }
    
    func addTask(controller: AddViewController, title: String, details: String, date: Date, isChecked: Bool, indexPath: NSIndexPath?) {
        if indexPath != nil {
        if let  index = indexPath {
            todoList[index.row].title = title
            todoList[index.row].details = details
            todoList[index.row].dueDate = date
            todoList[index.row].isChecked = isChecked
        }
        }else{
        let newTask = Todo(context: context)
        newTask.title = title
        newTask.details = details
        newTask.dueDate = date
        newTask.isChecked = isChecked
        }
        
        do{
            try context.save()
            fetchData()
        }catch{
            print("Failed to add Task")
        }
        
        dismiss(animated: true, completion: nil)
    }


    
    
    
    
    
    
}
