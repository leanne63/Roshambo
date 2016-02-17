//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by leanne on 2/17/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

	@IBOutlet weak var resultsImage: UIImageView!
	@IBOutlet weak var resultsLabel: UILabel!

	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
	@IBAction func playAgain(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
