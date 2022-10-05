//
//  FavoritesContactListVC.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class FavoritesContactListVC: UIViewController {
    
    //MARK: - Elements
    
    private var contactsView: FavoritesContactListView? {
        guard isViewLoaded else { return nil }
        return view as? FavoritesContactListView
    }
    
    var model = [Contact]()
    var filteredModel = [Contact]()

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = FavoritesContactListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = TestContactsModel.createModel()
        
        configureView()
        setupNavigationController()
        filterForFavouriteContact()
    }
    
    // MARK: - Setup
    
    private func configureView() {
        //contactsView?.tableView.delegate = self
        contactsView?.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Избранные"
    }
    
    // MARK: - Private functions
    
    private func filterForFavouriteContact() {
        for contact in model {
            if contact.isElected {
                filteredModel.append(contact)
            }
        }
    }
}

//MARK: - Extension with TableViewDataSource

extension FavoritesContactListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        filteredModel.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesContactTableViewCell") as! FavoritesContactTableViewCell
        cell.setupView(with: filteredModel[indexPath.row])
        
        return cell
    }
}

