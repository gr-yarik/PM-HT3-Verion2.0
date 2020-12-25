//
//  ViewController.swift
//  test
//
//  Created by Yaroslav Hrytsun on 14.12.2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        redView.layer.cornerRadius      = 10
        orangeView.layer.cornerRadius   = 10
        greenView.layer.cornerRadius    = 10
        purpleView.layer.cornerRadius   = 10
    
    }
    
    
}

