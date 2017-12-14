//
//  adminResultsTableViewController.swift
//  LKS
//
//  Created by Serhii Kyrychenko on 13/12/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class adminResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        FBManager.shared.getAllJuryNames { [unowned self] (arrayOfAllJuryNames) in
//            print("arrayOfAllJuryNames: ", arrayOfAllJuryNames)
//            for juryName in arrayOfAllJuryNames {
//                FBManager.shared.getAllJyryResults(juryName: juryName, result: { (crewContents, namesCrew) in
//                    print("juryName: ", juryName)
//                    print("namesCrew: ", namesCrew)
//                    print("crewContents: ", crewContents)
//                })
//
//            }
        
        
        
        
        
//
//            arrayOfAllJuryNames.map{jury in
//               let crews = juriesWithContents.value(forKey: jury) as! NSDictionary
//               let allCrewsUnderJury: [String] = crews.allKeys as! [String]
//
//            }
//
//            for each in arrayOfAllJuryNames {
//                print("----------")
//                print(juriesWithContents.value(forKey: each))
//                let a = juriesWithContents.value(forKey: each) as! NSDictionary
//                print("A Values: ",a.allValues)
//                print("A Keys: ", a.allKeys)
//
//                print("----------")
//            }
//
//
//
//
//
//
//
//            let arrayOfCrewNames: [String] = juriesWithContents.map {$0.key as! String}
//            print("juryNames: ", arrayOfCrewNames)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JuryRanksCell", for: indexPath) as! AdminResultTableViewCell
        cell.createLabelsForPrototype()

        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
