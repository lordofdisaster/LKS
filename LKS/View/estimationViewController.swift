//
//  estimationViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

protocol updateHeaderInformationWithRC: class {
    func updateHeaderInformation()
}


class estimationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var gradePicker: UIPickerView!
    @IBAction func confirmationButton(_ sender: Any) {
        delegate?.updateHeaderInformation()
    }
    
    let category = Estimation().category
    let grades = Estimation().grades
    weak var delegate: updateHeaderInformationWithRC?
    

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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCathegory()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.delegate == nil) {
            let some = ViewController()
            self.delegate = some
        }

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
}

