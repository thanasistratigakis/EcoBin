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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}