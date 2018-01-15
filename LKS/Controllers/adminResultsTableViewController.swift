    //
//  adminResultsTableViewController.swift
//  LKS
//
//  Created by Serhii Kyrychenko on 13/12/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit


    
class adminResultsTableViewController: UITableViewController, getJuryArray {
    var juryArray = [String]()
    var dataSource = [NSDictionary]()


    func returnJuryArray() -> [String] {
        return juryArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableWithNewData()
        observeChangesInJuriesMarks()
    }
    
    func updateTableWithNewData() {
        let myGroup = DispatchGroup()
        myGroup.enter()
        
        FBManager.shared.getAllJuryNames { [unowned self] (arrayOfAllJuryNames) in
            self.juryArray = arrayOfAllJuryNames
            
            for juryName in arrayOfAllJuryNames {
                myGroup.enter()
                FBManager.shared.getAllJyryResults(juryName: juryName, result: { (crewContents, namesCrew) in
                    for crew in namesCrew {
                        self.dataSource.append(self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: crew, juryName: juryName))
                    }
                    myGroup.leave()
                })
            }
            myGroup.leave()
        }
        myGroup.notify(queue: DispatchQueue.main, execute: {
            self.tableView.reloadData()
        })
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
        return 17
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JuryRanksCell", for: indexPath) as! AdminResultTableViewCell
        if self.juryArray.count > 0 && dataSource.count > 0 {
            
            
            cell.resultTotalRanksDict["crewNameLabel"]?.text = (dataSource[indexPath.row].value(forKey: "crewName") as! String)
            
            print("resultTotalRanksDict:::::::::::::::::::::::::: ", cell.resultTotalRanksDict)
            
            
            var arrayOfJuryMarks = [String]()
            var arrayOfJuriesWithTotal = juryArray
            
            
            dataSource.map{element in
                if element.value(forKey: "crewName")as! String == dataSource[indexPath.row].value(forKey: "crewName") as! String {
                    print(element.value(forKey: "total"))
                    arrayOfJuryMarks.append(element.value(forKey: "total") as! String)
                }
            }
            let totalForParticularCrew = arrayOfJuryMarks.map { Int($0) as Int!}
            let result = totalForParticularCrew.reduce(0, { x, y in x + y! })
        
            arrayOfJuryMarks.append(String(result))
            arrayOfJuriesWithTotal.append("Total")
            
            
            for jury in arrayOfJuriesWithTotal {
               
                cell.resultTotalRanksDict[jury]?.text = arrayOfJuryMarks[arrayOfJuriesWithTotal.index(of: jury)!] //.value(forKey: "total") as! String
            }
        }
        return cell
    }
    
    
    
    func parseFetchedDataFromDB(crewsContents: NSDictionary, crewName: String, juryName: String) -> NSDictionary {
        
        var contentsForCell = NSDictionary()
        
        
        
        
        
        let crewData = crewsContents.value(forKey: crewName) as! NSDictionary
        //   let crewScore = crewData.value(forKey: "score") as! NSDictionary
        //  print("SCORE: ", crewScore)
        print("CrewData",crewData)
        
        let nomination = String(describing:crewData.value(forKey: "nomination")!)
        let ageCategory = String(describing:crewData.value(forKey: "ageCategory")!)
        let league = String(describing:crewData.value(forKey: "league")!)
        
        //            let charachter = String(describing: crewScore.value(forKey: "charachter")!)
        //            let message = String(describing: crewScore.value(forKey: "message")!)
        //            let perfomance = String(describing: crewScore.value(forKey: "perfomance")!)
        //            let technique = String(describing: crewScore.value(forKey: "technique")!)
        //            let total = String(describing: crewScore.value(forKey: "total")!)
        let charachter = "0"
        let message = "0"
        let perfomance = "0"
        let technique = "0"
        let total = "0"
        
        contentsForCell = ["crewName" : crewName,
                           "technique" : technique,
                           "charachter" : charachter,
                           "perfomance" : perfomance,
                           "message" : message,
                           "total" : total,
                           "nomination" : nomination,
                           "ageCategory" : ageCategory,
                           "league" : league,
                           "juryName": juryName]

        return contentsForCell
        
    }
    
        func observeChangesInJuriesMarks(){
    
            FBManager.shared.ref.child("Juries").observe(.value, with: { (snapshot) in
                print("=========OBSERVE JURIES==========",snapshot)
                self.dataSource.removeAll()
                for juryName in self.juryArray {
                    
                    FBManager.shared.getAllJyryResults(juryName: juryName, result: { (crewContents, namesCrew) in
                        for crew in namesCrew {
                            self.dataSource.append(self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: crew, juryName: juryName))
                        }
                        self.tableView.reloadData()
                       
                    })
                    
                }

            }) { (error) in
                print(error.localizedDescription)
            }
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
