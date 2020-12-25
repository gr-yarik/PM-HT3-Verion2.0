//
//  ViewController.swift
//  Task-3
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var circle: UIView = {
        let circle = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .red
        return circle
    }()
    
    lazy var bigCircle: UIView = {
        let circle = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        circle.layer.cornerRadius = 80
        return circle
    }()
    
    let colors: [UIColor] = [.yellow, .orange, .red, .blue, .green, .purple]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circle)
        view.addSubview(bigCircle)
        configureCircles()
        swipesObservers()
        tapObserver()
    }
    
    
    func configureCircles() {
        circle.center = view.center
        bigCircle.center = view.center
        bigCircle.frame.origin.y += 40
    }
    
    
    private func swipesObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    private func tapObserver() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapAction))
        singleTap.numberOfTapsRequired = 1
        singleTap.require(toFail: doubleTap)
        self.view.addGestureRecognizer(singleTap)
    }
    
    
    @objc private func handleSwipes(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            UIView.animate(withDuration: 1.5) {
                self.circle.frame.origin.x += 30
                self.circle.backgroundColor = self.colors.randomElement()
            }
        case .left:
            UIView.animate(withDuration: 1.5) {
                self.circle.frame.origin.x -= 30
                self.circle.backgroundColor = self.colors.randomElement()
            }
        case .up:
            UIView.animate(withDuration: 1.5) {
                self.circle.frame.origin.y -= 30
                self.circle.backgroundColor = self.colors.randomElement()
            }
        case .down:
            UIView.animate(withDuration: 1.5) {
                self.circle.frame.origin.y += 30
                self.circle.backgroundColor = self.colors.randomElement()
            }
            
        default:
            break
        }
    }
    
    
    @objc private func singleTapAction() {
        UIView.animate(withDuration: 1.5) {
            self.circle.center = self.view.center
        }
    }
    
    
    @objc private func doubleTapAction() {
        if circle.center != view.center {
            UIView.animate(withDuration: 1.5) {
                self.circle.center = self.view.center
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.startAnimatingCircle()
            }
        } else {
            startAnimatingCircle()
        }
    }
    
    
    private func startAnimatingCircle() {
        let path = UIBezierPath()
        
        let initialPoint = self.getPoint(for: -90)
        path.move(to: initialPoint)
        
        for angle in -89...270 { path.addLine(to: self.getPoint(for: angle)) }
        
        path.close()
        
        self.animate(view: self.circle, path: path)
    }
    
    
    private func animate(view: UIView, path: UIBezierPath) {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = path.cgPath
        
        animation.repeatCount = 1
        
        animation.duration = 3
        
        view.layer.add(animation, forKey: "animation")
    }
    
    
    private func getPoint(for angle: Int) -> CGPoint {
        let radius = Double(self.bigCircle.layer.cornerRadius)
        
        let radian = Double(angle) * Double.pi / Double(180)

        let newCenterX =  radius * cos(radian) + Double(view.frame.width / 2)
        let newCenterY =  radius + radius * sin(radian) + Double(view.frame.height / 2)
        
        return CGPoint(x: newCenterX, y: newCenterY)
    }
}

