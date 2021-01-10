//
//  PlayerCell.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    var playerImageView = UIImageView()
    var playerNameLabel = UILabel()
    var playerAgeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(playerImageView)
        addSubview(playerNameLabel)
        addSubview(playerAgeLabel)
        
        configureImageView()
        configureNameLabel()
        configureAgeLabel()
        setImageConstrains()
        setNameLabelConstrains()
        setAgeLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        playerImageView.layer.cornerRadius = 25
        playerImageView.clipsToBounds = true
    }
    
    func configureNameLabel() {
        playerNameLabel.numberOfLines = 1
        playerNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureAgeLabel() {
        playerNameLabel.numberOfLines = 1
        playerNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstrains() {
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        playerImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playerImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setNameLabelConstrains() {
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playerNameLabel.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 20).isActive = true
        playerNameLabel.topAnchor.constraint(equalTo: playerImageView.topAnchor).isActive = true
        playerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setAgeLabelConstraint() {
        playerAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        playerAgeLabel.leadingAnchor.constraint(equalTo: playerNameLabel.leadingAnchor).isActive = true
        playerAgeLabel.bottomAnchor.constraint(equalTo: playerImageView.bottomAnchor).isActive = true
        playerAgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
