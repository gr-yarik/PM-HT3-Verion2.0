//
//  DetailsViewController.swift
//  Task-4
//
//  Created by Yaroslav Hrytsun on 25.12.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    
    let userImageView           = UIImageView()
    let usernameLabel       = PMTitleLabel(textAlignment: .center, fontSize: 50)
    let subLabel            = PMTitleLabel(textAlignment: .center, fontSize: 30)
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    let dateLabel           = PMBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    var username: String!

    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserImageView()
        configureUsernameLabel()
        configureSubLabel()
        configureViewController()
        configureScrollView()
        layoutUI()
        configureUIElements()
    }
    
    
    func configureUserImageView(){
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = Images.face
        userImageView.layer.cornerRadius = 100
        userImageView.clipsToBounds = true
        contentView.addSubview(userImageView)
    }
    
    
    func configureUsernameLabel(){
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = username
        contentView.addSubview(usernameLabel)
    }
    
    
    func configureSubLabel(){
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "Player enthusiast".localized()
        subLabel.textColor = .systemGray
        subLabel.adjustsFontSizeToFitWidth = true
        subLabel.minimumScaleFactor = 0.75
        contentView.addSubview(subLabel)
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismssVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 750)
        ])
    }
    
    
    func configureUIElements() {
        self.add(childVC: PMItemFansVC(), to: self.itemViewOne)
        self.add(childVC: PMItemAchievementsVC(), to: self.itemViewTwo)
        self.dateLabel.text = "Lorem ipsum text since Jan 2015".localized()
    }
    
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            userImageView.heightAnchor.constraint(equalToConstant: 200),
            userImageView.widthAnchor.constraint(equalToConstant: 200),
            userImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            subLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 0),
            subLabel.heightAnchor.constraint(equalToConstant: 40),
            subLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            subLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            itemViewOne.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),

            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
         
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismssVC() {
        dismiss(animated: true)
    }
}
