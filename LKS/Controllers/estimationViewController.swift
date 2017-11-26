//
//  estimationViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

protocol updateHeaderInformationWithRC: class {
    func updateHeaderInformationFromRemouteConfig()
}
protocol updateRanksTable: class {
    func updateTableWithNewValues(_values: [String:String], _totalScore: String)
}


class estimationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var gradePicker: UIPickerView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBAction func confirmationButton(_ sender: Any) {
        print(juryRatesAndComment)
        print(countTotalScoreForCrew(values: juryRatesAndComment))
        
        delegateTableUpdater?.updateTableWithNewValues(_values: juryRatesAndComment, _totalScore: countTotalScoreForCrew(values: juryRatesAndComment))
        nullifyGradePicker()
    }
    
    fileprivate let category = Estimation().category
    fileprivate let grades = Estimation().grades
    fileprivate var juryRatesAndComment = Estimation().juryRatesAndCommet
    
    weak var delegateHeaderUpdater: updateHeaderInformationWithRC?
    weak var delegateTableUpdater: updateRanksTable?
    

    func showCathegory() {
        let labelWidth = categoryLabel.frame.width / CGFloat(gradePicker.numberOfComponents)
        for index in 0..<category.count {
            let rect = CGRect(x: categoryLabel.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = category[index]
            label.textAlignment = .center
            categoryLabel.addSubview(label)
        }
    }
    
    func countTotalScoreForCrew(values: [String:String]) -> String {

        let convertible = values as NSDictionary
        guard let iv1: Int = Int(convertible.value(forKey: "TECHNIQUE") as! String ) else { return "" }
        guard let iv2: Int = Int(convertible.value(forKey: "CHARACTER") as! String) else { return "" }
        guard let iv3: Int = Int(convertible.value(forKey: "PERFOMANCE") as! String) else { return "" }
        guard let iv4: Int = Int(convertible.value(forKey: "MESSAGE") as! String) else { return "" }
    
        let result: Int = iv1 + iv2 + iv3 + iv4
        return String(result)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCathegory()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension estimationViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return grades[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        juryRatesAndComment.updateValue(grades[gradePicker.selectedRow(inComponent: 0)], forKey: "TECHNIQUE")
        juryRatesAndComment.updateValue(grades[gradePicker.selectedRow(inComponent: 1)], forKey: "CHARACTER")
        juryRatesAndComment.updateValue(grades[gradePicker.selectedRow(inComponent: 2)], forKey: "PERFOMANCE")
        juryRatesAndComment.updateValue(grades[gradePicker.selectedRow(inComponent: 3)], forKey: "MESSAGE")
    }
    
    func nullifyGradePicker() {
        for component in 0..<gradePicker.numberOfComponents {
            self.gradePicker.selectRow(0, inComponent: component, animated: true)
        }
        
    }
    
}

