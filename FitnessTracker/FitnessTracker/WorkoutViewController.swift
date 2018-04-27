//
//  WorkoutViewController.swift
//  FitnessTracker
//
//  Created by Cameron Wandfluh on 4/26/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {

    @IBOutlet weak var workoutDuration: UITextField!
    @IBOutlet weak var workoutCategory: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        workoutDuration.delegate = self as! UITextFieldDelegate
//        workoutCategory.delegate = self as! UITextFieldDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        workoutCategory.resignFirstResponder()
        workoutDuration.resignFirstResponder()
    }
    
    @IBAction func saveWorkout(_ sender: Any) {
        let durationText = workoutDuration.text ?? ""
        let duration = Int16(durationText) ?? 0
        let category = workoutCategory.text
        let date = Date()
        
        if let workout = Workout(category: category, date: date, duration: duration) {
            do {
                let managedContext = workout.managedObjectContext
                
                try managedContext?.save()
                self.navigationController?.popViewController(animated: true)
                
            } catch {
                print("Workout Could not be saved")
            }
        }
    }
    
}
