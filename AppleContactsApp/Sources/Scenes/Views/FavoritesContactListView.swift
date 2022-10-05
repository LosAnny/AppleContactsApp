//
//  FavoritesContactListView.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class FavoritesContactListView: UIView {

    // MARK: - Outlets
    
    lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: .zero, style: .plain)
        
        tableView.backgroundColor = .white
        tableView.rowHeight = 60
        tableView.register(FavoritesContactTableViewCell.self, forCellReuseIdentifier: FavoritesContactTableViewCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Initial
        
    init() {
        super.init(frame: .zero)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    private func commonInit() {
        backgroundColor = .white
        
        setupHierarchy()
        setupLayouts()
    }
    
    
    // MARK: - Setup
        
    private func setupHierarchy() {
        addSubview(tableView)
    }
        
    private func setupLayouts() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
