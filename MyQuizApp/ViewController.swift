//
//  ViewController.swift
//  MyQuizApp
//
//  Created by Hung-Chun Tsai on 2020-12-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func trueBtnDidTouch(_ sender: Any) {
    }
    
    @IBAction func falseBtnDidTouch(_ sender: Any) {
    }
    
}

