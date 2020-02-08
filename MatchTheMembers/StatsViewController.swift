//
//  StatsViewController.swift
//  MatchTheMembers
//
//  Created by Colin Zhou on 2020-02-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var streak: UILabel!
    
    @IBOutlet weak var result1: UILabel!
    
    @IBOutlet weak var result2: UILabel!
    
    @IBOutlet weak var result3: UILabel!
    
    @IBAction func dismiss(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    
    var longestStreak = 0
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result1.text = text1
        result2.text = text2
        result3.text = text3
        streak.text = "Longest Streak: \(String(longestStreak))"

        // Do any additional setup after loading the view.
    }
    
    
    

}
