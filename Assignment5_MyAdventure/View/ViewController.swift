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
        let userChoice = sender.titleLabel!.text!
        let isCorrect = directionLogic.compareUserResponse(userChoice)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if directionLogic.isFinished() {
            displayResults()
        } else {
            directionLogic.NextQuestion()
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }
    
    func displayResults() {
        
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        
        directionLabel.text = directionLogic.getResultMessage()
        scoreLabel.text = "Final Score: \(directionLogic.getScore())"
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) {
            _ in self.directionLogic.reset()
            self.updateUI()
        }
    }
    
    @objc func updateUI() {
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(directionLogic.getScore())"
        directionLabel.text = directionLogic.getNextDirection()
        buttonOne.setTitle(directionLogic.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(directionLogic.getChoiceTwo(), for: .normal)
    }
    
    
    
    
}
    
    

