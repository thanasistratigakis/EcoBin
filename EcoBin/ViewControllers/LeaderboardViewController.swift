//
//  LeaderboardViewController.swift
//  EcoBin
//
//  Created by Thanasi Stratigakis on 9/5/15.
//  Copyright (c) 2015 Thanasi Stratigakis. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaderboardTableView.delegate = self
        leaderboardTableView.registerNib(UINib(nibName: "LeaderboardUserCell", bundle: nil), forCellReuseIdentifier: "LeaderboardUserTableViewCell")
        leaderboardTableView.registerNib(UINib(nibName: "LeaderboardLabelCell", bundle: nil), forCellReuseIdentifier: "LeaderboardLabelTableViewCell")
        leaderboardTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension LeaderboardViewController: UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.layoutMargins = UIEdgeInsetsZero
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // code here
        if indexPath.row == 100 {
           // let cell = UITableViewCell()
            let cell = tableView.dequeueReusableCellWithIdentifier("LeaderboardLabelTableViewCell", forIndexPath: indexPath) as! LeaderboardLabelCell
            return cell
        } else if indexPath.row >= 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("LeaderboardUserTableViewCell", forIndexPath: indexPath) as! LeaderboardUserCell
            return cell
        } else {
            let cell = UITableViewCell()
            return cell
        }

        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

            return 80
        
        
        
    }
    

    
    
    
    
}
