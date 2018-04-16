//
//  InformationController.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 08/01/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit

class InformationController: UITableViewController {

    var dates = ["16.02.2018","17.02.2018","20.02.2018"]
    var flightInfo = [
        "16.02.2018":[
            ["departureTime":"07:20",
             "arrivalTime":"08:30",
             "departure":"IST",
             "arrival":"ESB",
             "flightNo":"TK217",
             "terminal":"T2",
             "gate":"G36K"],
            ["departureTime":"09:00",
             "arrivalTime":"10:30",
             "departure":"ESB",
             "arrival":"DBK",
             "flightNo":"TK217",
             "terminal":"T1",
             "gate":"A12"],
            ["departureTime":"12:00",
             "arrivalTime":"18:00",
             "departure":"DBK",
             "arrival":"MNH",
             "flightNo":"TK561",
             "terminal":"A5",
             "gate":"G01"]
        ],
        "17.02.2018":[
            ["departureTime":"05:15",
             "arrivalTime":"19:30",
             "departure":"IST",
             "arrival":"JFK",
             "flightNo":"TK202",
             "terminal":"T5",
             "gate":"G92A"],
        ],
        "20.02.2018":[
            ["departureTime":"06:00",
             "arrivalTime":"12:30",
             "departure":"JFK",
             "arrival":"HTR",
             "flightNo":"TK174",
             "terminal":"T9",
             "gate":"G54"],
            ["departureTime":"14:30",
             "arrivalTime":"00:30",
             "departure":"HTR",
             "arrival":"SYD",
             "flightNo":"TK512",
             "terminal":"T4",
             "gate":"G65U"]
        ]
    ]

    var selectedIndex : IndexPath? {
        didSet{
            
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return flightInfo.keys.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = InformationSection()
        header.date.text = self.dates[section]
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (flightInfo[dates[section]]?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flight") as! FlightCell
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath == selectedIndex { return 250 } else { return 170 }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //SEGUE
        //self.navigationController?.performSegue(withIdentifier: "goToEvent", sender: nil)
        //if indexPath == selectedIndex { selectedIndex = nil } else { selectedIndex = indexPath}
    }
    
    

}
