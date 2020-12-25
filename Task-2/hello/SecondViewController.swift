//
//  SecondViewController.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    let shapeSize: CGFloat = 200
    
    let squareView: UIView = {
        let squareView = UIImageView(frame: .zero)
        squareView.translatesAutoresizingMaskIntoConstraints  = false
        return squareView
    }()
    
    let circleView: UIView = {
        let circleView = UIImageView(frame: .zero)
        circleView.backgroundColor                            = .white
        circleView.translatesAutoresizingMaskIntoConstraints  = false
        return circleView
    }()
    
    var squareHeightConstraint: NSLayoutConstraint!
    var squareWidthConstraint: NSLayoutConstraint!
    
    var circleHeightConstraint: NSLayoutConstraint!
    var circleWidthConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(squareView)
        view.addSubview(circleView)
        layoutUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animate()
    }
    
    
    func animate() {
        var counter = 0
        let squareColors: [UIColor] = [.black, .red, .green, .orange, .white]
        let circleColors: [UIColor] = [.white, .blue, .yellow, .purple, .black]
        squareView.backgroundColor = squareColors[counter]
        circleView.backgroundColor = circleColors[counter]
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.squareView.backgroundColor = squareColors[counter]
            self.circleView.backgroundColor = circleColors[counter]
            counter += 1
            if counter == squareColors.count {
                timer.invalidate()
                self.squareView.backgroundColor = squareColors.last
                self.circleView.backgroundColor = circleColors.last
            }
        }
    }
   
    
    func layoutUI() {
        circleView.layer.cornerRadius = shapeSize / 3
        
        squareHeightConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize)
        squareWidthConstraint = NSLayoutConstraint(item: squareView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize)
        
        circleHeightConstraint = NSLayoutConstraint(item: circleView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize / 1.5)
        circleWidthConstraint = NSLayoutConstraint(item: circleView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: shapeSize / 1.5)
        
        NSLayoutConstraint.activate([
            squareHeightConstraint, squareWidthConstraint, circleWidthConstraint, circleHeightConstraint,
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
}

