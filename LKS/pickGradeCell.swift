//
//  pickGradeCell.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class pickGradeCell: UICollectionViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK:- vars
    
    let grades = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return grades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    }
    

    @IBOutlet weak var gradesPicker: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}
