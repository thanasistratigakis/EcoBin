//
//  AddFriendsViewController.swift
//  EcoBin
//
//  Created by Thanasi Stratigakis on 9/5/15.
//  Copyright (c) 2015 Thanasi Stratigakis. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var users: [PFUser]?
    
    // this view can be in two different states
    enum State {
        case DefaultMode
        case SearchMode
    }
    
    // whenever the state changes, perform one of the two qeries and update the list
    var state: State = .DefaultMode {
        didSet {
            switch (state) {
            case .DefaultMode:
                println()
                //do stuff
            case .SearchMode:
                let searchText = searchBar?.text ?? ""
                // query stuff
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
