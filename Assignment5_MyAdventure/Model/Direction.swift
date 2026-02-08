//
//  Direction.swift
//  Assignment5_MyAdventure
//
//  Created by Colby Brown on 2/8/26.
//

import Foundation

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
