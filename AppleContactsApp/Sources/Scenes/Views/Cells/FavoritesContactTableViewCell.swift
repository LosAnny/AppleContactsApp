//
//  FavoritesContactTableViewCell.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class FavoritesContactTableViewCell: UITableViewCell {

    // MARK: - Configuration
        
    static let identifier = "FavoritesContactTableViewCell"
    
    // MARK: - Elements
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = contentView.layer.frame.height / 2
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.tintColor = .black
        accessoryType = .detailButton
        
        setupHierarchy()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
        nameLabel.text = ""
        accessoryType = .detailButton
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(profileImage)
        addSubview(nameLabel)
    }
        
    private func setupLayouts() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
    }
    
    // MARK: - Public Methods
    
    func setupView(with model: Contact) {
        if let image = model.profileImage {
            profileImage.image = UIImage(named: image)
        }
        nameLabel.text = model.firstName
    }
}
