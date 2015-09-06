//
//  FriendSearchTableViewCell.swift
//  EcoBin
//
//  Created by Thanasi Stratigakis on 9/5/15.
//  Copyright (c) 2015 Thanasi Stratigakis. All rights reserved.
//

import UIKit


protocol FriendSearchTableViewCellDelegate: class {
    func cell(cell: FriendSearchTableViewCell, didSelectFollowUser user: PFUser)
    func cell(cell: FriendSearchTableViewCell, didSelectUnfollowUser user: PFUser)
}

class FriendSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendButton: UIButton!
    weak var delegate: FriendSearchTableViewCellDelegate?
    
    var user: PFUser? {
        didSet {
            nameLabel.text = user?.username
        }
    }
    
    var canFriend: Bool? = true {
        didSet {
            /*
            Change the state of the follow button based on whether or not
            it is possible to follow a user.
            */
            if let canFriend = canFriend {
                friendButton.selected = !canFriend
            }
        }
    }
    
    
    
    
    @IBAction func friendButtonTapped(sender: AnyObject) {
        if let canFriend = canFriend where canFriend == true {
            delegate?.cell(self, didSelectFollowUser: user!)
            self.canFriend = false
        } else {
            delegate?.cell(self, didSelectUnfollowUser: user!)
            self.canFriend = true
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
