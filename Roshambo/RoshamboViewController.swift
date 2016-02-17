//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by leanne on 2/17/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func userDidChooseItem(sender: UIButton) {
		guard let senderId = sender.restorationIdentifier else {
			return
		}
		switch senderId {
		case "rock":
			print("code-only segue to rock result")

		case "paper":
			print("code and manual segue to paper result")
			
		case "scissors":
			print("auto segue to scissors result")

		default:
			print(sender.restorationIdentifier)
		}
	}

}

