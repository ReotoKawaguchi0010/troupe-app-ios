//
//  ViewController.swift
//  troupeApp
//
//  Created by 河口怜和人 on 2021/12/04.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !http(){
            performSegue(withIdentifier: "login", sender: nil)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
    }
    
}

