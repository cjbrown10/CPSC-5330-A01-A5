//
//  DirectionLogic.swift
//  Assignment5_MyAdventure
//
//  Created by Colby Brown on 2/8/26.
//

import Foundation

struct DirectionLogic {
    
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
    
    mutating func compareUserResponse(_ response: String) -> Bool {
        if response == direction[directionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func NextQuestion() {
        if directionIndex < direction.count {
            directionIndex += 1
        }
    }
    
    func isFinished() -> Bool {
        return directionIndex + 1 >= direction.count
    }
    
    func getResultMessage() -> String {
        if score >= 3 {
            return "Congratulations! 🥳 You have chosen the path to sucessfully exit the maze."
        }
        else {
            return "Sorry, you have failed to navigate out of the maze. 🙁 Try again."
        }
    }
    
    mutating func reset() {
        score = 0
        directionIndex = 0
    }
        
    func getScore() -> Int {
        return score
    }
    
    func getNextDirection() -> String {
        return direction[directionIndex].direction
    }
    
    func getChoiceOne() -> String {
        return direction[directionIndex].choice_one
    }
    
    func getChoiceTwo() -> String {
        return direction[directionIndex].choice_two
    }
    
    
}

    
    
    
