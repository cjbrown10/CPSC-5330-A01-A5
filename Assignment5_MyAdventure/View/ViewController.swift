//
//  ViewController.swift
//  Assignment5_MyAdventure
//
//  Created by Colby Brown on 2/7/26.
//



import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    
    var directionLogic = DirectionLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        guard let userChoice = sender.titleLabel?.text else { return }
        
        let isCorrect = directionLogic.compareUserResponse(userChoice)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        directionLogic.directionIndex += 1
        if directionLogic.directionIndex < directionLogic.direction.count {
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            scoreLabel.text = "Score: \(directionLogic.getScore())"
            displayResults()
        }
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(directionLogic.getScore())"
        
        directionLabel.text = directionLogic.getNextDirection()
        buttonOne.setTitle(directionLogic.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(directionLogic.getChoiceTwo(), for: .normal)
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }
    
    func displayResults() {
        
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        
        if directionLogic.getScore() >= 3 {
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
        directionLogic.score = 0
        directionLogic.directionIndex = 0
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        updateUI()
    }
}
    
    

