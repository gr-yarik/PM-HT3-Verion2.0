//
//  FourthViewController.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//


import UIKit

class FourthViewController: UIViewController {
    
    let circlesView = AnimatedCirclesView()
    
    
    override func viewDidLoad() {
        view.clipsToBounds = false
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        circlesView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesView)
        layoutUI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        circlesView.startAnimatingDarkCircle()
        circlesView.startAnimatingLightCircle()
    }
    
    
    func layoutUI() {
        NSLayoutConstraint.activate([
            circlesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circlesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circlesView.heightAnchor.constraint(equalToConstant: 95),
            circlesView.widthAnchor.constraint(equalToConstant: 95),
        ])
    }
}

