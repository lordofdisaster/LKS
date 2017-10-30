//
//  estimationViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class estimationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    @IBOutlet weak var gradePicker: UIPickerView!
    
    let grades = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", ]
    let category = ["TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return grades[row]
    }
    
    
    
        func showCathegory() {
                let labelWidth = gradePicker.frame.width / CGFloat(gradePicker.numberOfComponents)
    
                for index in 0..<category.count {
                    let rect = CGRect(x: gradePicker.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
                    let label = UILabel.init(frame: rect)
    
                    label.text = category[index]
                    label.backgroundColor = UIColor.black
                    label.textColor = UIColor.white
    
                    label.textAlignment = .left
                        gradePicker.addSubview(label)
                }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                showCathegory()
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

