//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by leanne on 2/17/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {

	// MARK: - Properties

	var opponentChoice: GameChoices!

	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// ensure the segue identifier isn't nil
		guard let segueId = segue.identifier else {
			return
		}

		// pass self's values over to destination controller
		let destController = segue.destination as! ResultsViewController

		destController.opponentChoice = opponentChoice

		switch segueId {
		case "paperSegue" :
			destController.userChoice = GameChoices.paper

		case "scissorsSegue":
			destController.userChoice = GameChoices.scissors

		default:
			// rock was a code only segue, so see userDidChooseItem for its actions
			return
		}
	}

	// MARK: - Actions

	@IBAction func userDidChooseItem(_ sender: UIButton) {
		// ensure the sender's resoration id isn't nil
		guard let senderId = sender.restorationIdentifier else {
			return
		}

		// id isn't nil, so move on to segue
		opponentChoice = randomOpponentChoice()

		switch senderId {
		case "rock":
			// programmatic, so do everything in code:
			//	(there is no segue in the storyboard for this option)
			// instantiate results view controller
			let resultsViewController = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsViewController

			// set values on result view controller
			resultsViewController.userChoice = GameChoices.rock
			resultsViewController.opponentChoice = opponentChoice

			// present the view controller
			present(resultsViewController, animated: true, completion: nil)

		case "paper":
			// manual segue, so kick if off in code, and handle rest in prepareForSegue
			//	(segue in storyboard goes from RoshamboViewController to ResultsViewController)
			performSegue(withIdentifier: "paperSegue", sender: self)

		default:
			// scissors will auto-segue, so handle everything in prepareForSegue
			//	(segue in storyboard goes directly from scissors icon to ResultsViewController)
			return
		}
	}

	// MARK: - Utility Functions

	/**
	* Randomly generates an Int from 1 to 6
	*/
	func randomOpponentChoice() -> GameChoices {
		// Generate a random Int32 using arc4Random, converting to Int for this purpose
		let randomValue = 1 + arc4random() % 3

		// Return a more convenient Int, initialized with the random value
		let randomValueInt = Int(randomValue)
		return GameChoices(rawValue: randomValueInt)!
	}

}

