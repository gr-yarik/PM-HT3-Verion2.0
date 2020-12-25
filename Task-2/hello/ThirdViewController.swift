//
//  ThirdViewController.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let shapeSize: CGFloat = 100
    
    let squareView: UIView = {
        let squareView = UIImageView(frame: .zero)
        squareView.backgroundColor                            = .cyan
        squareView.translatesAutoresizingMaskIntoConstraints  = false
        return squareView
    }()
    
    var squareHeightConstraint: NSLayoutConstraint!
    var squareWidthConstraint: NSLayoutConstraint!
    
    
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
            self.squareView.layer.cornerRadius = self.shapeSize / 2
            self.view.layoutIfNeeded()
        }
        completion: { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UIView.animate(withDuration: 2) {
                    self.squareView.layer.cornerRadius = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    
    func layoutUI() {
        squareHeightConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize)
        squareWidthConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize)
        
        NSLayoutConstraint.activate([
            squareHeightConstraint, squareWidthConstraint,
            squareView.topAnchor.constraint(equalTo: view.topAnchor, constant: 66 + 50),
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ])
    }
}

