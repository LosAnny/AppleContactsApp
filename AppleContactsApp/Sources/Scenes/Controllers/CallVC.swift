//
//  CallVC.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 06.10.2022.
//

import UIKit

class CallVC: UIViewController {

    //MARK: - Elements
    
    private let contact: Contact
    
    private var callView: CallView? {
        guard isViewLoaded else { return nil }
        return view as? CallView
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
        self.view = CallView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        callView?.setupView(with: contact)
        callView?.addDownPhoneButtonTarget(self, action: #selector(dismissVC))
    }
    
    // MARK: - Objc func
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
