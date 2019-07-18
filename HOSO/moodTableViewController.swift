//
//  moodTableViewController.swift
//  SOHO Calendar
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class moodTableViewController: UITableViewController {
    var calendar : [MoodCD] = []
    func getMoods() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataMoods = try? context.fetch(MoodCD.fetchRequest()) as? [MoodCD] {
                calendar = coreDataMoods
                tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendar.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let mood = calendar[indexPath.row]
        print(mood.emoji)
        print(mood.name)
        print(mood.date)
        cell.textLabel?.text = "\(mood.emoji!) \(mood.date!) \(mood.name!)"
        //cell.textLabel?.text = mood.date! + " " + mood.emoji! + " " mood.name!
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMoods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? SecondViewController {
            addVC.previousVC = self
        }
    }
}
