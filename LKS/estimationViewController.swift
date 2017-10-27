//
//  estimationViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class estimationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellsOfGradesPicker = [pickGradeCell]()
    let category = ["TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE"]
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gradesCell", for: indexPath) as! pickGradeCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

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
