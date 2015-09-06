//
//  LeaderboardUserCell.swift
//  EcoBin
//
//  Created by Thanasi Stratigakis on 9/5/15.
//  Copyright (c) 2015 Thanasi Stratigakis. All rights reserved.
//

import UIKit

class LeaderboardUserCell: UITableViewCell {
    
    // Outlets go here
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bottlesLabel: UILabel!
    
    
    var user: PFUser? {
        didSet {
            
            
            var thisUser = user
            thisUser!.fetchInBackgroundWithBlock { (result, error) -> Void in
                
                //bottlesLabel.text =
                
                let bottles = thisUser!.objectForKey("bottles")
                if let bottles = bottles {
                    self.bottlesLabel.text = String(stringInterpolationSegment: bottles)
                }
                
                let name = thisUser!.objectForKey("name")
                if let name = name {
                    self.nameLabel.text = name as! String
                }
                
                //self.bottlesLabel.text = String(stringInterpolationSegment: bottles)
                
                println(thisUser?.objectForKey("bottles"))
                
            }
            
            
//            println(user)
//            //nameLabel.text = user?.username
//            
//            
//            println(user!.objectForKey("bottles"))
//            //bottlesLabel.text = String(stringInterpolationSegment: user?.objectForKey("bottles"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}