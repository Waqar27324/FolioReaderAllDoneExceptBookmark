//
//  FolioReaderBookmarkCell.swift
//  NFolioReaderKit
//
//  Created by Abdullah Shahid on 27/11/2022.
//

import UIKit

class FolioReaderBookmarkListCell: UITableViewCell {
    
    var bookmarkName: String? {
        didSet {
            nameLabel.text = bookmarkName
        }
    }
    
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        layoutMargins = UIEdgeInsets.zero
        preservesSuperviewLayoutMargins = false
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: "Avenir-Light", size: 17)
        nameLabel.textColor = UIColor(rgba: "#767676")
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboards are incompatible with truth and beauty")
    }
}
