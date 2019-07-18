//
//  addStoryViewController.swift
//  SOHO Calendar
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController {
    var previousVC = moodTableViewController()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var storyTyped: UITextField!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitStory(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = MoodCD(entity: MoodCD.entity(), insertInto: context)
            if let titleText = storyTyped.text {
                toDo.name = titleText
                var dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                var strDate = dateFormatter.string(from: datePicker.date)
                toDo.date = strDate
                toDo.emoji = appDelegate.selectedEmoji
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
        //        let toDo = moodCalendar()
        //        if let titleText = storyTyped.text {
        //            toDo.name = titleText
        //        }
        //        var dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "dd-MM-yyyy"
        //        var strDate = dateFormatter.string(from: datePicker.date)
        //        toDo.date = strDate
        //        previousVC.calendar.append(toDo)
        //        previousVC.tableView.reloadData()
        //        navigationController?.popViewController(animated: true)
    }
}
