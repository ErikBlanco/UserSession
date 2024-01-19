//
//  HomeViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out \(error.localizedDescription)")
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}

