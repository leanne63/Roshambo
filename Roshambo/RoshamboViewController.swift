//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by leanne on 2/17/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {
	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	// MARK: - Actions

	@IBAction func userDidChooseItem(sender: UIButton) {
		// ensure the sender's resoration id isn't nil
		guard let senderId = sender.restorationIdentifier else {
			return
		}

		// id isn't nil, so get the "opponent's" choice
		let opponentChoice = randomOpponentChoice()

		switch senderId {
		case "rock":
			performRockSegueWithCodeOnly(opponentChoice)

		case "paper":
			print("code and manual segue to paper result")

		case "scissors":
			print("auto segue to scissors result")

		default:
			return
		}
	}

	// MARK: - Utility Functions

	/**
	* Randomly generates an Int from 1 to 6
	*/
	func randomOpponentChoice() -> Int {
		// Generate a random Int32 using arc4Random
		let randomValue = 1 + arc4random() % 3

		// Return a more convenient Int, initialized with the random value
		let choice = Int(randomValue)
		return choice
	}

	func performRockSegueWithCodeOnly(opponentChoice: Int) {
		// instantiate results view controller
		let resultsViewController = storyboard?.instantiateViewControllerWithIdentifier("ResultsVC") as! ResultsViewController

		// set result value on result view controller
		resultsViewController.opponentChoice = opponentChoice

		// present the view controller
		presentViewController(resultsViewController, animated: true, completion: nil)


	}

}

