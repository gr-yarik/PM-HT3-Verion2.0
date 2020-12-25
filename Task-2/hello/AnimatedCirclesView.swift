//
//  AnimatedCirclesView.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class AnimatedCirclesView: UIView {
    
    let darkCircle: UIView = {
        let darkCirlce = UIView()
        darkCirlce.backgroundColor = UIColor(red: 31/255, green: 138/255, blue: 112/255, alpha: 1)
        darkCirlce.translatesAutoresizingMaskIntoConstraints  = false
        darkCirlce.clipsToBounds = true
        return darkCirlce
    }()
    
    let lightCircle: UIView = {
        let lightCircle = UIView(frame: .zero)
        lightCircle.backgroundColor        = UIColor(red: 190/255, green: 218/255, blue: 57/255, alpha: 1)
        lightCircle.translatesAutoresizingMaskIntoConstraints  = false
        return lightCircle
    }()
    
    let invisibleCircle: UIView = {
        let invisibleCircle = UIView()
        invisibleCircle.translatesAutoresizingMaskIntoConstraints = false
        invisibleCircle.clipsToBounds = true
        return invisibleCircle
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setup() {
        self.clipsToBounds = false
        self.addSubview(self.invisibleCircle)
        self.addSubview(lightCircle)
        self.addSubview(darkCircle)
        layoutUI()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.invisibleCircle.layer.cornerRadius = self.invisibleCircle.frame.width / 2.0
        self.darkCircle.layer.cornerRadius = self.darkCircle.frame.width / 2.0
        self.lightCircle.layer.cornerRadius = self.lightCircle.frame.width / 2.0
        
        self.darkCircle.center = self.getPoint(for: -90)
        self.lightCircle.center = self.getPoint(for: 90)
    }

    
    func startAnimatingDarkCircle() {
        let path = UIBezierPath()
        
        let initialPoint = self.getPoint(for: -90)
        path.move(to: initialPoint)
        
        for angle in -89...90 { path.addLine(to: self.getPoint(for: angle)) }
        
        var i = 90
        for _ in 0...100 {
            path.addLine(to: self.getPoint(for: 90))
        }
        
        while true {
            path.addLine(to: self.getPoint(for: i))
            i -= 1
            if i == -90 { break }
        }
        path.close()
    
        self.animate(view: self.darkCircle, path: path)
    }
    
    
    func startAnimatingLightCircle() {
        let path = UIBezierPath()
        
        let initialPoint = self.getPoint(for: 90)
        path.move(to: initialPoint)
        
        for angle in 90...270 { path.addLine(to: self.getPoint(for: angle)) }
        
        var i = 270
        for _ in 0...100 {
            path.addLine(to: self.getPoint(for: 270))
        }
        while true {
            path.addLine(to: self.getPoint(for: i))
            i -= 1
            if i == 90 { break }
        }
    
        path.close()
        
        self.animate(view: self.lightCircle, path: path)
    }
    
    
    private func animate(view: UIView, path: UIBezierPath) {

        let animation = CAKeyframeAnimation(keyPath: "position")
    
        animation.path = path.cgPath
        
        animation.repeatCount = 1
        
        animation.duration = 2
        
        view.layer.add(animation, forKey: "animation")
    }
    
    
    private func getPoint(for angle: Int) -> CGPoint {
        let radius = Double(self.invisibleCircle.layer.cornerRadius)
    
        let radian = Double(angle) * Double.pi / Double(180)
        
        let newCenterX = radius + radius * cos(radian)
        let newCenterY = radius + radius * sin(radian)
        
        return CGPoint(x: newCenterX, y: newCenterY)
    }
    
    
    func layoutUI() {
        NSLayoutConstraint.activate([
            self.invisibleCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.invisibleCircle.topAnchor.constraint(equalTo: self.topAnchor),
            self.invisibleCircle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.invisibleCircle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.darkCircle.widthAnchor.constraint(equalToConstant: 120),
            self.darkCircle.heightAnchor.constraint(equalToConstant: 120),
            self.lightCircle.heightAnchor.constraint(equalToConstant: 120),
            self.lightCircle.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
