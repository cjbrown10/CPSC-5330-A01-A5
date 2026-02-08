//
//  ViewController.swift
//  Assignment5_MyAdventure
//
//  Created by Colby Brown on 2/7/26.
//

struct Direction {
    
    init(_ direc: String, _ c_one: String, _ c_two: String, _ ans: String) {
        direction = direc
        choice_one = c_one
        choice_two = c_two
        answer = ans
    }
    
    var direction: String
    var choice_one: String
    var choice_two: String
    var answer: String
}

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    
    var directionIndex : Int = 0
    var score : Int = 0
    
    let direction = [
        Direction("You have entered the MyAdventure maze! Which direction do you want to proceed?",
                 "Left",
                 "Right",
                 "Right"),
        Direction("Which direction do you want to take on your second step?",
                 "Forward",
                  "Left",
                  "Forward"),
        Direction("Which direction do you want to choose for your third step",
                 "Right",
                 "Forward",
                 "Forward"),
        Direction("You've reached your final decision. How do your wish to end this adventure?",
                 "Left",
                 "Right",
                 "Left")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        
        guard let userChoice = sender.titleLabel?.text else { return }
        
        let isCorrect = compareUserResponse(userChoice)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
       // increaseIndex()
       directionIndex += 1
        if directionIndex < direction.count {
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            scoreLabel.text = "Score: \(score)"
            displayResults()
        }
        
            
        
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(score)"
        
        directionLabel.text = direction[directionIndex].direction
        buttonOne.setTitle(direction[directionIndex].choice_one, for: .normal)
        buttonTwo.setTitle(direction[directionIndex].choice_two, for: .normal)
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }
    
    func compareUserResponse(_ response: String) -> Bool {
        if response == direction[directionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    //func increaseIndex() {
      //  if directionIndex < direction.count - 1 {
        //    directionIndex += 1
        //} else {
          //  directionIndex = 0
            //score = 0
        //}
  //  }
    
    func displayResults() {
        
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        
        if score >= 3 {
            directionLabel.text = "Congratulations! 🥳 You have chosen the path to sucessfully exit the maze."
        }
        else {
            directionLabel.text = "Sorry, you have failed to navigate out of the maze. 🙁 Try again."
        }
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) {
            _ in self.resetGame()
        }
    }
    
    func resetGame() {
        score = 0
        directionIndex = 0
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        updateUI()
    }
}
    
    

