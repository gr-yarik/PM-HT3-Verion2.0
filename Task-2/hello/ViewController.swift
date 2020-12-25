//
//  ViewController.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let squareView: UIView = {
        let squareView = UIImageView(frame: .zero)
        squareView.backgroundColor                            = .black
        squareView.translatesAutoresizingMaskIntoConstraints  = false
        return squareView
    }()
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(squareView)
        layoutUI()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    
    func animate() {
        UIView.animate(withDuration: 2) {
            self.widthConstraint.constant = 200
            self.heightConstraint.constant = 200
            self.squareView.center = self.view.center
            self.view.layoutIfNeeded()
        } completion: { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if done ==  true {
                    self.heightConstraint.constant = 100
                    self.widthConstraint.constant = 100
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    
    func layoutUI() {
        heightConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        widthConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([
            heightConstraint, widthConstraint,
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

