//
//  WorkoutTableViewController.swift
//  FitnessTracker
//
//  Created by Cameron Wandfluh on 4/26/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit
import CoreData

class WorkoutTableViewController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    var workouts = [Workout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        do {
            workouts =  try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("fetch didnt work yo")
        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let workout = workouts[indexPath.row]
        
        cell.textLabel?.text = workout.category
        if let date = workout.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        }
        return cell
    }

}









