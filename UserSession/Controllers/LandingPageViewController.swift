//
//  LandingPageViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import FirebaseAuth
import UIKit

class LandingPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let _ = Auth.auth().currentUser?.uid else { return }
        performSegue(withIdentifier: SegueConstants.homeId, sender: self)
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.signInId, sender: self)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.registerId, sender: self)
    }
}

