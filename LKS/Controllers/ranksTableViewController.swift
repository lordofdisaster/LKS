//
//  ranksTableViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class ranksTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    let category = ["CREW NAME","TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE", "TOTAL SCORE"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crewCell", for: indexPath) as! CrewRankCellTableViewCell
        // FIXME: - crews array
        cell.configureCell(labelWidth: categoryLabel.frame.width, crews: ["TEST"])
        return cell
        
    }
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
          showHeader()
        
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

    func showHeader() {
        let labelWidth = categoryLabel.frame.width / CGFloat(category.count)
        for index in 0..<category.count {
            let rect = CGRect(x: categoryLabel.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = category[index]
            label.textAlignment = .center
            categoryLabel.addSubview(label)
        }
    }
    
}
