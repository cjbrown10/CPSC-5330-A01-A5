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

    
    
    
