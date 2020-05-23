//
//  ViewController.swift
//  RPS
//
//  Created by Asvin Sritharan on 2020-05-19.
//  Copyright © 2020 AsvinSritharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func update(_ gameState: GameState) {
        // (GameState) -> Void
        // Given a game state, update the screen based on
        // the current game state.
        
        // if the gamestate says the game has just begun
        if gameState == .Start {
            // set the status text to be a generic rock paper
            // scissors statement
            Status.text = "Rock, Paper, Scissors?"
            // set the appsign to be the emoji representing
            // the computer
            AppSign.text = "🤖"
            // disable the play again button since we have
            // begun the game. Also hide it
            playAgain.isEnabled = false
            playAgain.isHidden = true
            // enable and unhide the buttons which allow players
            // to choose rock
            playerRock.isEnabled = true
            playerRock.isHidden = false
            // enable and unhide the buttons which allow players
            // to choose paper
            playerPaper.isEnabled = true
            playerPaper.isHidden = false
            // enable and unhide the buttons which allow players
            // to choose scissors
            playerScissors.isEnabled = true
            playerScissors.isHidden = false
        // if the game state has been calculated to a lose state
        // display a lose message in the status label
        } else if gameState == .Lose {
            Status.text = "Bro I murked you fam"
        // if the game state has been calculated to a win state
        // display a win message in the status label
        } else if gameState == .Win {
            Status.text = "Jheeze you beat me fam"
        } else {
            Status.text = "We picked the same one fam"
        }
        
    }
    func play(_ sign: Sign) {
        // (Sign) -> Void
        // given a sign representing the player's choice of
        // either rock, paper, or scissors, calculate the
        // computer's choice and determine who won the game
        
        // get a random sign representing the computer's choice
        let newSign = randomSign()
        // get the game state based on the choice of the player
        // and the choice of the game
        let currState = sign.outcome(newSign)
        // update the screen using the final result of the game
        // represented as a gameState
        update(currState)
        // set the app sign to be the choice of the computer
        AppSign.text = newSign.emoji
        // disable all of the buttons for the player since
        // they have already made their choice
        playerScissors.isEnabled = false
        playerRock.isEnabled = false
        playerPaper.isEnabled = false
        // if the player chose scissors then hide all buttons
        // except scissors to highlight the user choice
        if sign.self == .scissors {
            playerScissors.isHidden = false
            playerRock.isHidden = true
            playerPaper.isHidden = true
        // if the player chose rock then hide all buttons
        // except rock to highlight the user choice
        } else if sign.self == .rock {
            playerRock.isHidden = false
            playerScissors.isHidden = true
            playerPaper.isHidden = true
        // if the player chose anything else (paper) then hide all buttons
        // except scissors to highlight the user choice
        } else {
            playerPaper.isHidden = false
            playerScissors.isHidden = true
            playerRock.isHidden = true
        }
        // now that the game is complete, we unhide and enable the play
        // again button
        playAgain.isHidden = false
        playAgain.isEnabled = true
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // update the game once the app begins to have a game state of a
        // start status
        update(.Start)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var AppSign: UILabel!
    
    @IBOutlet weak var Status: UILabel!
    
    @IBOutlet weak var playerRock: UIButton!
    
    @IBOutlet weak var playerPaper: UIButton!
    
    @IBOutlet weak var playerScissors: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func tapRock(_ sender: UIButton) {
        // play the game with the user choice being rock
        play(.rock)
    }
    
    @IBAction func tapPaper(_ sender: UIButton) {
        // play the game with the user choice being paper
        play(.paper)
    }
    
    @IBAction func tapScissors(_ sender: UIButton) {
        // play the game with the user choice being scissors
        play(.scissors)
    }
    
    @IBAction func tapPlayAgain(_ sender: UIButton) {
        // restart the game
        update(.Start)
    }
    
}

