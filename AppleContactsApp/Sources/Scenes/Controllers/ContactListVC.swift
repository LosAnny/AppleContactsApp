//
//  ContactListVC.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 04.10.2022.
//

import UIKit

class ContactListVC: UIViewController {
    
    //MARK: - Elements
    
    private var contactsView: ContactListView? {
        guard isViewLoaded else { return nil }
        return view as? ContactListView
    }
    
    var model: [Contact]?
    var sectionTitles = [String]()
    var contactsDictionary = [String: [Contact]]()

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = ContactListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = TestContactsModel.createModel()
        
        configureView()
        setupNavigationController()
        configureDictionaryWithContacts()
    }
    
    // MARK: - Setup
    
    private func configureView() {
        //contactsView?.tableView.delegate = self
        contactsView?.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Контакты"
        navigationItem.searchController = setupSearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSearchController() -> UISearchController {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")

        return searchController
    }
    
    func configureDictionaryWithContacts() {
        guard let model = model else { return }

        for contact in model {
            let contactKey = String(contact.firstName.prefix(1))
            if var contactValues = contactsDictionary[contactKey] {
                contactValues.append(contact)
                contactsDictionary[contactKey] = contactValues
            } else {
                contactsDictionary[contactKey] = [contact]
            }
        }
        
        sectionTitles = [String](contactsDictionary.keys)
        sectionTitles = sectionTitles.sorted(by: {$0 < $1})
    }
}

//MARK: - Extension with TableViewDataSource

extension ContactListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let contactKey = sectionTitles[section]
        if let contactValues = contactsDictionary[contactKey] {
            return contactValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell

        let contactKey = sectionTitles[indexPath.section]
        if let contactValues = contactsDictionary[contactKey] {
            cell.setupView(with: contactValues[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
}
