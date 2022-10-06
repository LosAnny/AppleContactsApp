//
//  ContactTableViewCell.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    // MARK: - Configuration
        
    static let identifier = "ContactTableViewCell"
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.tintColor = .black
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
    }
    
    // MARK: - Public Methods
    
    func setupView(with model: Contact) {
        textLabel?.text = model.firstName
    }
}
