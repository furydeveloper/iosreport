//
//  MusicTableViewCell.swift
//  iTunesMusicProject
//
//  Created by Fury on 07/06/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    static let identifier = "MusicTableViewCell"

    let musicImage: UIImageView = {
        let musicImage = UIImageView()
        musicImage.translatesAutoresizingMaskIntoConstraints = false
        return musicImage
    }()
    
    let musicName: UILabel = {
        let musicName = UILabel()
        musicName.translatesAutoresizingMaskIntoConstraints = false
        return musicName
    }()
    
    let artistName: UILabel = {
        let artistName = UILabel()
        artistName.translatesAutoresizingMaskIntoConstraints = false
        return artistName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        addContentView()
        autoLayout()
    }
    
    private func configure() {
        musicName.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private func addContentView() {
        contentView.addSubview(musicImage)
        contentView.addSubview(musicName)
        contentView.addSubview(artistName)
    }
    
    private func autoLayout() {
        let margin: CGFloat = 10
        NSLayoutConstraint.activate([
            musicImage.topAnchor.constraint(equalTo: self.topAnchor),
            musicImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            musicImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            musicImage.widthAnchor.constraint(equalTo: musicImage.heightAnchor),
            
            musicName.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
            musicName.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: margin),
            musicName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            artistName.topAnchor.constraint(equalTo: musicName.bottomAnchor),
            artistName.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: margin),
            artistName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            artistName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin * 2),
            artistName.heightAnchor.constraint(equalTo: musicName.heightAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
