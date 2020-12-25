//
//  PMItemAchievementsVC.swift
//  Task-4
//
//  Created by Yaroslav Hrytsun on 25.12.2020.
//

import UIKit

class PMItemAchievementsVC: PMItemInfoVC {
    
    override init() {
        super.init()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .game, withCount: 453)
        itemInfoViewTwo.set(itemInfoType: .win, withCount: 340)
        actionButton.set(backgroundColor: .red, title: "Check Stats".localized())
    }
}

