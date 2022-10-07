//
//  FavoritesContactListVC.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class FavoritesContactListVC: UIViewController {
    
    //MARK: - Elements
    
    var contactsView: FavoritesContactListView? {
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
    
    func reloadTable() {
        model = TestContactsModel.createModel()
        configureView()
        filterForFavouriteContact()
        contactsView?.tableView.reloadData()
    }
    
    private func configureView() {
        contactsView?.tableView.delegate = self
        contactsView?.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Избранные"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: nil)
    }
    
    // MARK: - Private functions
    
    private func filterForFavouriteContact() {
        filteredModel = [Contact]()
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
        return filteredModel.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesContactTableViewCell") as! FavoritesContactTableViewCell
        cell.setupView(with: filteredModel[indexPath.row])
        
        return cell
    }
}

//MARK: - Extension with UITableViewDelegate

extension FavoritesContactListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = filteredModel[indexPath.row]
        let controller = CallVC(contact: contact)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let contact = filteredModel[indexPath.row]
        let controller = DetailContactVC(contact: contact)
        
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
