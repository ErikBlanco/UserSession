//
//  LandingPageViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class LandingPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.signInId, sender: self)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.registerId, sender: self)
    }
}

