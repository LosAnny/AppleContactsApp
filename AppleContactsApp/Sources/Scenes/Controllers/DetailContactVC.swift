//
//  DetailContactVC.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class DetailContactVC: UIViewController {
    
    //MARK: - Elements
    
    private let contact: Contact
    
    private var detailContactView: DetailContactView? {
        guard isViewLoaded else { return nil }
        return view as? DetailContactView
    }
    
    // MARK: - Initialization

    init(contact: Contact) {
      self.contact = contact
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = DetailContactView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailContactView?.setupView(with: contact)
        detailContactView?.addAnotherMainButtonTarget(self, action: #selector(openCallVC))
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Objc func
    
    @objc func openCallVC() {
        let controller = CallVC(contact: contact)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
