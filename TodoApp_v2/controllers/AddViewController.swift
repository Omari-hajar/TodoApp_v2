//
//  AddViewController.swift
//  TodoApp_v2
//
//  Created by Hajar Alomari on 15/12/2021.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var TitleTF: UITextField!
    
    @IBOutlet weak var detailsTV: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: TaskDelegate?
    var indexPath: NSIndexPath?
     var titleName: String?
    var details: String?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if indexPath != nil{
            TitleTF.text = titleName
            detailsTV.text = details
            datePicker.date = date!
        }
        
    }
    

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        
        let title = TitleTF.text
        let details = detailsTV.text  ?? "Unknown"
        let date = datePicker.date
        print(date)
        if title != "" && title != nil  {
            delegate?.addTask(controller: self, title: title!, details: details, date: date, isChecked: false, indexPath: indexPath)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please, make sure to fill the title field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
   
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
