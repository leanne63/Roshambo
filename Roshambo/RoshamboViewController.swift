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

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// ensure the segue identifier isn't nil
		guard let segueId = segue.identifier else {
			return
		}

		// pass self's values over to destination controller
		let destController = segue.destinationViewController as! ResultsViewController

		destController.opponentChoice = opponentChoice

		switch segueId {
		case "paperSegue" :
			destController.userChoice = GameChoices.Paper

		case "scissorsSegue":
			destController.userChoice = GameChoices.Scissors

		default:
			// rock was a code only segue, so see userDidChooseItem for its actions
			return
		}
	}

	// MARK: - Actions

	@IBAction func userDidChooseItem(sender: UIButton) {
		// ensure the sender's resoration id isn't nil
		guard let senderId = sender.restorationIdentifier else {
			return
		}

		// id isn't nil, so move on to segue
		opponentChoice = randomOpponentChoice()

		switch senderId {
		case "rock":
			// programmatic, so do everything in code:
			// instantiate results view controller
			let resultsViewController = storyboard?.instantiateViewControllerWithIdentifier("ResultsVC") as! ResultsViewController

			// set values on result view controller
			resultsViewController.userChoice = GameChoices.Rock
			resultsViewController.opponentChoice = opponentChoice

			// present the view controller
			presentViewController(resultsViewController, animated: true, completion: nil)

		case "paper":
			// manual segue, so kick if off in code, and handle rest in prepareForSegue
			performSegueWithIdentifier("paperSegue", sender: self)

		default:
			// scissors will auto-segue, so handle everything in prepareForSegue
			return
		}
	}

	// MARK: - Utility Functions

	/**
	* Randomly generates an Int from 1 to 6
	*/
	func randomOpponentChoice() -> GameChoices {
		// Generate a random Int32 using arc4Random, converting to Int for this purpose
		let randomValue = Int(1 + arc4random() % 3)

		// Return a more convenient Int, initialized with the random value
		return GameChoices(rawValue: randomValue)!
	}

}

