//
//  CallView.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 06.10.2022.
//

import UIKit

class CallView: UIView {

    // MARK: - Outlets
    
    private lazy var contactInfoStack = createVerticalStackView(alignment: .center, distribution: .fillEqually, spacing: 10)
    private lazy var nameLabel = createLabel(text: "Имя", fontSize: 30, textColor: .white)
    private lazy var callLabel = createLabel(text: "вызов...", fontSize: 20, textColor: .white)
    
    private lazy var mainButtonStack = createVerticalStackView(alignment: .fill, distribution: .fillEqually, spacing: 30)
    
    private lazy var firstButtonStack = createHorizontalStackView()
    private lazy var soundButton = createButton(with: "mic.slash.fill", backgroundColor: .systemGray)
    private lazy var keysButton = createButton(with: "circle.grid.3x3.fill", backgroundColor: .systemGray)
    private lazy var audioButton = createButton(with: "speaker.wave.2.fill", backgroundColor: .systemGray)
    
    private lazy var secondButtonStack = createHorizontalStackView()
    private lazy var addButton = createButton(with: "plus", backgroundColor: .systemGray)
    private lazy var faceTimeButton = createButton(with: "questionmark.video.fill", backgroundColor: .systemGray)
    private lazy var contactsButton = createButton(with: "person.circle", backgroundColor: .systemGray)
    
    private lazy var downPhoneButton = createButton(with: "phone.down.fill", backgroundColor: .red)
    
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
        backgroundColor = .darkGray
        
        setupHierarchy()
        setupLayouts()
    }
    
    
    // MARK: - Setup
        
    private func setupHierarchy() {
        
        addSubview(contactInfoStack)
        contactInfoStack.addArrangedSubview(nameLabel)
        contactInfoStack.addArrangedSubview(callLabel)
        
        addSubview(mainButtonStack)
        
        mainButtonStack.addArrangedSubview(firstButtonStack)
        firstButtonStack.addArrangedSubview(soundButton)
        firstButtonStack.addArrangedSubview(keysButton)
        firstButtonStack.addArrangedSubview(audioButton)
        
        mainButtonStack.addArrangedSubview(secondButtonStack)
        secondButtonStack.addArrangedSubview(addButton)
        secondButtonStack.addArrangedSubview(faceTimeButton)
        secondButtonStack.addArrangedSubview(contactsButton)
        
        addSubview(downPhoneButton)
    }
        
    private func setupLayouts() {
        
        contactInfoStack.translatesAutoresizingMaskIntoConstraints = false
        contactInfoStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        contactInfoStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        contactInfoStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        mainButtonStack.translatesAutoresizingMaskIntoConstraints = false
        mainButtonStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainButtonStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        downPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        downPhoneButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        downPhoneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Private functions for create UI
    
    private func createVerticalStackView(alignment: UIStackView.Alignment,
                                         distribution: UIStackView.Distribution,
                                         spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        
        return stack
    }
    
    private func createHorizontalStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 30
        
        return stack
    }
    
    private func createLabel(text: String,
                             fontSize: CGFloat,
                             textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = text
        
        return label
    }
    
    private func createButton(with imageName: String,
                              backgroundColor: UIColor) -> UIButton {

        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 10).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        button.layer.masksToBounds = true
        button.layer.cornerRadius = UIScreen.main.bounds.height / 20
        button.backgroundColor = backgroundColor
        button.tintColor = .white
        
        return button
    }
    
    // MARK: - Actions
    
    func addDownPhoneButtonTarget(_ target: Any?, action: Selector) {
        downPhoneButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // MARK: - Public Methods
    
    func setupView(with model: Contact) {
        
        if let secondName = model.secondName {
            nameLabel.text = model.firstName + " " + secondName
        } else {
            nameLabel.text = model.firstName
        }
    }
}
