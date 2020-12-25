//
//  ViewController.swift
//  orientation
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class IPadViewController: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var innerRedGreenstack: UIStackView!
    @IBOutlet weak var innerYellowPurplestack: UIStackView!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius      = 10
        orangeView.layer.cornerRadius   = 10
        greenView.layer.cornerRadius    = 10
        purpleView.layer.cornerRadius   = 10
        // Do any additional setup after loading the view.
    }


    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            stack.axis = .horizontal
            innerRedGreenstack.axis = .horizontal
            innerYellowPurplestack.axis = .horizontal
            
            innerYellowPurplestack.removeArrangedSubview(greenView)
            innerYellowPurplestack.removeArrangedSubview(purpleView)

            innerYellowPurplestack.insertArrangedSubview(purpleView, at: 0)
            innerYellowPurplestack.insertArrangedSubview(greenView, at: 1)
        } else {
            stack.axis = .horizontal
            innerRedGreenstack.axis = .vertical
            innerYellowPurplestack.removeArrangedSubview(greenView)
            innerYellowPurplestack.removeArrangedSubview(purpleView)
            
            innerYellowPurplestack.insertArrangedSubview(greenView, at: 0)
            innerYellowPurplestack.insertArrangedSubview(purpleView, at: 1)
            innerYellowPurplestack.axis = .vertical
        }
    }
}

