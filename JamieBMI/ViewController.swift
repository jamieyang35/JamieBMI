//
//  ViewController.swift
//  JamieBMI
//
//  Created by stoller on 2019/3/21.
//  Copyright © 2019年 stoller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GenderSeg: UISegmentedControl!
    @IBOutlet weak var SmokeLabel: UILabel!
    @IBOutlet weak var HeightTextField: UITextField!
    @IBOutlet weak var SmokeSwitch: UISwitch!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var BMIResult: UILabel!
    @IBOutlet weak var AgeTextField: UITextField!
    @IBOutlet weak var ExpectedAgeLabel: UILabel!

    @IBOutlet weak var WorkoutSlider: UISlider!
    @IBOutlet weak var WorkoutLabel: UILabel!
    
    var indexBMI : Int = 0
    var smokeInd : Int = 0
    var workoutInd : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func SmokeChanged(_ sender: UISwitch) {
        
        
        if sender.isOn == true {
            SmokeLabel.text = "Yes"
            smokeInd = -3
        }
        else {SmokeLabel.text = "No"
            smokeInd = 0
        }
    }
    
    @IBAction func WorkoutChanged(_ sender: UISlider) {
        WorkoutSlider.value.round()
        
        if sender.value == Float(0){
            WorkoutLabel.text = " Never"
            workoutInd = -3
        }
        else if sender.value == Float(1){
            WorkoutLabel.text = " Once a week"
            workoutInd = -2
        }
        else if sender.value == Float(2){
            WorkoutLabel.text = " Twice a week"
            workoutInd = 0
        }
        else if sender.value == Float(3){
             WorkoutLabel.text = " 3 times a week"
                workoutInd = 1
        }
        else if sender.value == Float(4){
            WorkoutLabel.text = " 4 times a week"
            workoutInd = 1
        }
        else if sender.value == Float(5){
            WorkoutLabel.text = " 5 times a week"
            workoutInd = 2
        }
        else if sender.value == Float(6){
            WorkoutLabel.text = " 6 times a week"
            workoutInd = 2
        }
        else if sender.value == Float(7){
            WorkoutLabel.text = "Workout forever"
            workoutInd = 2
        }
    }
    @IBAction func BMICalculate(_ sender: Any) {
        var genderInd = 0
        

        if let heightText = HeightTextField.text, let weightText = WeightTextField.text, let height = Double(heightText), let weight = Double(weightText) {
            let heightInMeter = Double(height/100)
            let BMI = weight / (heightInMeter * heightInMeter)
            BMIResult.text = String(format: "%.2f", BMI)
            view.endEditing(true)
            
            if GenderSeg.selectedSegmentIndex == 0 { genderInd = -4}
            else if
                GenderSeg.selectedSegmentIndex == 1 { genderInd = 0}
            
            if GenderSeg.selectedSegmentIndex == 0 { genderInd = -4}
            else if
                GenderSeg.selectedSegmentIndex == 1 { genderInd = 0}
            
            if Double (BMI) >= 30 {
                indexBMI = -1}
            else if Double (BMI) >= 20, Double (BMI) < 30 {
                indexBMI = 0}
            else if Double (BMI) < 20 {
                indexBMI = 1}
            else { indexBMI = 0 }
            
            if let age = Int( AgeTextField.text!){
                if age >= 20, age < 29 {
                    ExpectedAgeLabel.text = String ( Int(indexBMI + 80 + Int(genderInd)+Int(smokeInd) + Int(workoutInd)))}
                else if age >= 30, age < 39 {
                    ExpectedAgeLabel.text = String ( Int(indexBMI + 82 + Int(genderInd)+Int(smokeInd) + Int(workoutInd)))}
                else if age >= 40, age < 49 {
                    ExpectedAgeLabel.text = String (Int(indexBMI + 84 + Int(genderInd)+Int(smokeInd) + Int(workoutInd))) }
                else if age >= 50, age < 59 {
                    ExpectedAgeLabel.text = String (Int(indexBMI + 86 + Int(genderInd)+Int(smokeInd) + Int(workoutInd))) }
                else {
                    ExpectedAgeLabel.text = "Rejuvenation"}
                }
            
            
            
        }
    }
    

}

