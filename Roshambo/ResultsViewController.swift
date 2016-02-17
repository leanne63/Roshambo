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
	var opponentChoice: Int?

	@IBOutlet weak var resultsImage: UIImageView!
	@IBOutlet weak var resultsLabel: UILabel!

	// MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
	// MARK: - Actions
	@IBAction func playAgain(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
