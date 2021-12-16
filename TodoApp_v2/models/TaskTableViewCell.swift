//
//  TaskTableViewCell.swift
//  TodoApp_v2
//
//  Created by Hajar Alomari on 15/12/2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
 
    @IBOutlet weak var isCheckedIV: UIImageView!
    
    
    
    func setTask(title: String, details: String, date: Date, isChecked: Bool){
        titleLabel.text = title
        detailsLabel.text = details
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        let dateFormated = formatter.string(from: date)
        dueDateLabel.text = "Due Date: \(dateFormated)"
        
        if isChecked {
            isCheckedIV.image = UIImage(named: "isChecked")
        } else{
            isCheckedIV.image = UIImage(named: "unChecked")
        }
    }
}
