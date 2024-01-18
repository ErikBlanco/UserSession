//
//  ViewController.swift
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

    @IBAction func btnTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            performSegue(withIdentifier: SegueConstants.signInId, sender: self)
        case 2:
            performSegue(withIdentifier: SegueConstants.registerId, sender: self)
        default:
            print(ErrorConstants.Unknown_New_Let_Found)
        }
    }
    
}

