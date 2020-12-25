//
//  PMItemInfoView.swift
//  Task-4
//
//  Created by Yaroslav Hrytsun on 25.12.2020.
//

import UIKit

enum ItemInfoType {
    case video, heart, game, win
}

class PMItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel      = PMTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel      = PMTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubviews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 40),
            symbolImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            countLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .video:
            symbolImageView.image   = Icons.video
            titleLabel.text         = "Videos".localized()
        case .heart:
            symbolImageView.image   = Icons.heart
            titleLabel.text         = "Hearts".localized()
        case .game:
            symbolImageView.image   = Icons.game
            titleLabel.text         = "Games".localized()
        case .win:
            symbolImageView.image   = Icons.win
            titleLabel.text         = "Wins".localized()
        }
        
        countLabel.text             = String(count)
    }
}
