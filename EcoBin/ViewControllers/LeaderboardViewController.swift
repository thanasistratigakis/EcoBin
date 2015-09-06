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
    
    var friends: [PFUser]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaderboardTableView.delegate = self
        leaderboardTableView.registerNib(UINib(nibName: "LeaderboardUserCell", bundle: nil), forCellReuseIdentifier: "LeaderboardUserTableViewCell")
        leaderboardTableView.registerNib(UINib(nibName: "LeaderboardLabelCell", bundle: nil), forCellReuseIdentifier: "LeaderboardLabelTableViewCell")
        leaderboardTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        ParseHelper.getFollowingUsersForUser(PFUser.currentUser()!) {
            (results:[AnyObject]?, error: NSError?) -> Void in
            let relations = results as? [PFObject] ?? []
            // use map to extract the User from a Follow object
            self.friends = relations.map {
                $0.objectForKey(ParseHelper.ParseFollowToUser) as! PFUser
            }
            self.leaderboardTableView.reloadData()
        
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension LeaderboardViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.layoutMargins = UIEdgeInsetsZero
        
        if let friends = friends {
            return friends.count
        } else {
            return 0
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // code here
        if indexPath.row == 100 {
           // let cell = UITableViewCell()
            let cell = tableView.dequeueReusableCellWithIdentifier("LeaderboardLabelTableViewCell", forIndexPath: indexPath) as! LeaderboardLabelCell
            return cell
        } else if indexPath.row >= 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("LeaderboardUserTableViewCell", forIndexPath: indexPath) as! LeaderboardUserCell
            var rankNum = indexPath.row + 1
            cell.rankLabel.text = String(rankNum)
            cell.user = friends?[indexPath.row]
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
