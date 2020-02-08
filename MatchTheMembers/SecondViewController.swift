//
//  SecondViewController.swift
//  MatchTheMembers
//
//  Created by Colin Zhou on 2020-02-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    @IBOutlet weak var fourth: UIButton!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var statistics: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!


    var currentName = ""
    var scoreNum = 0
    var resumeTapped = false
    var longestStreak1 = 0
    var streakTracker = 0
    
    var nameList = ["", "", "", ""]
    
    var resultArray = [String]()
    
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SecondViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            
            self.goNext()
             //You lose
        } else {
             seconds -= 1     //This will decrement(count down)the seconds.
             timeLabel.text = "Time: \(seconds)" //This will update the label.
        }
    }
    

    func getRandomName() -> String { //Generate a random name from Constants
        let random = Int.random(in: 0 ..< Constants.names.count)
        return Constants.names[random]
    }
    
    
    func changeImage(_ name: String) { //Change image of main picture
        profile.image=Constants.getImageFor(name: name)
    }
    
    func changeButtons(_ name: String) {
        //Select one button at random to put correct name, put correctness = true
        //Place a random name at every other button, put correctness = false
        let correctButtonNumber = Int.random(in: 0 ..< 4)

        if (correctButtonNumber == 0) {
            nameList[0] = name
            first.setTitle(name, for: .normal)
            second.setTitle(getRandomName(), for: .normal)
            third.setTitle(getRandomName(), for: .normal)
            fourth.setTitle(getRandomName(), for: .normal)
        } else if (correctButtonNumber == 1) {
            nameList[1] = name
            first.setTitle(getRandomName(), for: .normal)
            second.setTitle(name, for: .normal)
            third.setTitle(getRandomName(), for: .normal)
            fourth.setTitle(getRandomName(), for: .normal)
        } else if (correctButtonNumber == 2) {
            nameList[2] = name
            first.setTitle(getRandomName(), for: .normal)
            second.setTitle(getRandomName(), for: .normal)
            third.setTitle(name, for: .normal)
            fourth.setTitle(getRandomName(), for: .normal)
        } else if (correctButtonNumber == 3) {
            nameList[3] = name
            first.setTitle(getRandomName(), for: .normal)
            second.setTitle(getRandomName(), for: .normal)
            third.setTitle(getRandomName(), for: .normal)
            fourth.setTitle(name, for: .normal)
        }
    }
    
    func resetButtonColors() {
        first.backgroundColor = UIColor.systemYellow
        second.backgroundColor = UIColor.systemYellow
        third.backgroundColor = UIColor.systemYellow
        fourth.backgroundColor = UIColor.systemYellow
    }
    
    func goNext() { //Change everything for the next round
        nameList = ["", "", "", ""]
        currentName = getRandomName()
        resetButtonColors()
        changeImage(currentName)
        changeButtons(currentName)
        resetTimer()
    }
    
    func resetTimer() { //Reset the timer to 5 seconds
        seconds = 5    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        timeLabel.text = "Time: \(seconds)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goNext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("here")
        runTimer()
    }
    
    
    @IBAction func pause(_ sender: Any) {
        if self.resumeTapped == false {
             timer.invalidate()
            pauseButton.setTitle("Resume", for: .normal)
             self.resumeTapped = true
        } else {
             runTimer()
            scoreNum=0
            streakTracker = 0
            score.text = "Score: \(scoreNum)"
            pauseButton.setTitle("Pause", for: .normal)
             self.resumeTapped = false
        }
    }
    
    
    @IBAction func option1(_ sender: Any) {
        if (nameList[0] == currentName) {
            first.backgroundColor = UIColor.green
            
            resultArray.append("\(currentName) - Correct")
            
            scoreNum += 1
            streakTracker += 1
            if (streakTracker > longestStreak1) {
                longestStreak1 = streakTracker
            }
            score.text = "Score: \(scoreNum)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
        } else {
            
            resultArray.append("Incorrect")
            
            first.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
        }
    }
    
    @IBAction func option2(_ sender: Any) {
        if (nameList[1] == currentName) {
            
            resultArray.append("\(currentName) - Correct")
            
            second.backgroundColor = UIColor.green
            scoreNum += 1
            streakTracker += 1
            if (streakTracker > longestStreak1) {
                longestStreak1 = streakTracker
            }
            score.text = "Score: \(scoreNum)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
            
        } else {
            
            resultArray.append("Incorrect")
            second.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
        }
    }
    
    @IBAction func option3(_ sender: Any) {
        if (nameList[2] == currentName) {
            
            resultArray.append("\(currentName) - Correct")
            
            third.backgroundColor = UIColor.green
            scoreNum += 1
            streakTracker += 1
            if (streakTracker > longestStreak1) {
                longestStreak1 = streakTracker
            }
            score.text = "Score: \(scoreNum)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
            
        } else {
            
            resultArray.append("Incorrect")
            third.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
        }
    }
    
    @IBAction func option4(_ sender: Any) {
        if (nameList[3] == currentName) {
            
            resultArray.append("\(currentName) - Correct")
            
            fourth.backgroundColor = UIColor.green
            scoreNum += 1
            streakTracker += 1
            if (streakTracker > longestStreak1) {
                longestStreak1 = streakTracker
            }
            score.text = "Score: \(scoreNum)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
            
        } else {
            resultArray.append("Incorrect")
            fourth.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.goNext()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destVC = segue.destination as? StatsViewController, segue.identifier == "toStats" {
            segue.destination.modalPresentationStyle = .fullScreen
            destVC.longestStreak = longestStreak1
            if (resultArray.count >= 1) {
                destVC.text1 = resultArray[resultArray.count-1]
            }
            if (resultArray.count >= 2) {
                destVC.text2 = resultArray[resultArray.count-2]
            }
            if (resultArray.count >= 3) {
                destVC.text3 = resultArray[resultArray.count-3]
            }
            timer.invalidate()
            
            
            //pass longest streak
            //pass past 3 results
        }
        
    }
    
    @IBAction func statistics(_ sender: Any) {
        

        
    }
    
}
