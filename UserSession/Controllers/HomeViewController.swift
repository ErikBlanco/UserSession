//
//  HomeViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        // TO DO: Kill user's session
        
        //
        self.navigationController?.popToRootViewController(animated: true)
    }
}

