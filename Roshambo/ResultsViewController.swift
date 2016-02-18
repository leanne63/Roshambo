//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by leanne on 2/17/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

	// MARK: - Properties
	var userChoice: GameChoices!
	var opponentChoice: GameChoices!

	@IBOutlet weak var resultsImage: UIImageView!
	@IBOutlet weak var resultsLabel: UILabel!

	// MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

		let choices = (userChoice.rawValue, opponentChoice.rawValue)

		switch choices {
		case let (user, opponent) where user == opponent:
			resultsImage.image = UIImage(named: "ItsATie")
			resultsLabel.text = "Its a Tie!"

		case (1, 3):
			resultsImage.image = UIImage(named: "RockCrushesScissors")
			resultsLabel.text = "Rock crushes Scissors - you win!"

		case (2, 1):
			resultsImage.image = UIImage(named: "PaperCoversRock")
			resultsLabel.text = "Paper covers Rock - you win!"

		case (3, 2):
			resultsImage.image = UIImage(named: "ScissorsCutPaper")
			resultsLabel.text = "Scissors cut Paper - you win!"

		case (3, 1):
			resultsImage.image = UIImage(named: "RockCrushesScissors")
			resultsLabel.text = "Rock crushes Scissors - opponent wins!"

		case (1, 2):
			resultsImage.image = UIImage(named: "PaperCoversRock")
			resultsLabel.text = "Paper covers Rock - opponent wins!"

		case (2, 3):
			resultsImage.image = UIImage(named: "ScissorsCutPaper")
			resultsLabel.text = "Scissors cut Paper - opponent wins!"
			
		default:
			print("userChoice: \(userChoice)\nopponentChoice: \(opponentChoice)\n")
		}
    }
    
	// MARK: - Actions
	@IBAction func playAgain(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
