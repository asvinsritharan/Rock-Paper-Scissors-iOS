//
//  Sign.swift
//  RPS
//
//  Created by Asvin Sritharan on 2020-05-19.
//  Copyright © 2020 AsvinSritharan. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue:0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}


enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    func outcome(_ opponentSign: Sign) -> GameState {
        if (opponentSign == self) {
            return .Draw
        } else if (self == .paper && opponentSign == .rock) {
            return .Lose
        } else if (self == .rock && opponentSign == .paper) {
            return .Win
        } else if (self == .scissors && opponentSign == .paper) {
            return .Win
        } else if (self == .paper && opponentSign == .scissors) {
            return .Lose
        } else if (self == .scissors && opponentSign == .rock) {
            return .Lose
        } else if (self == .rock && opponentSign == .scissors) {
            return .Win
        } else {
            return .Start
        }
    }
}


