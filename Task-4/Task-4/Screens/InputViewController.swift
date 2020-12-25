//
//  ViewController.swift
//  Task-4
//
//  Created by Yaroslav Hrytsun on 25.12.2020.
//

import UIKit

class InputViewController: UIViewController {

    let ballImageView       = UIImageView()
    let usernameTextField   = PMTextField()
    let callToActionButton  = PMButton(backgroundColor: .systemRed, title: "Give Me Some Details")
    let sloganLabel         = PMTitleLabel(textAlignment: .center, fontSize: 40)
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(sloganLabel, ballImageView, usernameTextField, callToActionButton)
        configureSloganLabel()
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
        usernameTextField.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentPMAlertOnMainThread(title: "Empty Username", message: "Please enter a username", buttonTitle: "Ok")
            return
        }
        
        usernameTextField.resignFirstResponder()
        
        let detailsViewController = DetailsViewController(username: usernameTextField.text!)
        present(UINavigationController(rootViewController: detailsViewController), animated: true, completion: nil)
    }
    
    
    func configureSloganLabel(){
        sloganLabel.translatesAutoresizingMaskIntoConstraints = false
        sloganLabel.text = "Beyond Limits"
    }
    
    
    func configureLogoImageView() {
        ballImageView.translatesAutoresizingMaskIntoConstraints = false
        ballImageView.image = Images.ball
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 40
        let ballSize: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 130 : 200
        
        NSLayoutConstraint.activate([
            ballImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant),
            ballImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImageView.heightAnchor.constraint(equalToConstant: ballSize),
            ballImageView.widthAnchor.constraint(equalToConstant: ballSize),
            
            sloganLabel.topAnchor.constraint(equalTo: ballImageView.bottomAnchor, constant: 20),
            sloganLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sloganLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    func configureTextField() {
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: sloganLabel.bottomAnchor, constant: 30),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton() {
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
