//
//  DetailContactView.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 05.10.2022.
//

import UIKit

class DetailContactView: UIView {

    // MARK: - Outlets
    
    private lazy var contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = UIScreen.main.bounds.width / 8
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Имя"
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var stackForMainButton = createHorizontalStackView(distribution: .fillEqually, spacing: 10)
    
    private lazy var messageMainButton = createMainButton(imageName: "message.fill",
                                                          text: "написать")
    private lazy var anotherMainButton = createMainButton(imageName: "phone.fill",
                                                          text: "другой")
    private lazy var videoMainButton = createMainButton(imageName: "video.fill",
                                                        text: "видео")
    private lazy var envelopeMainButton = createMainButton(imageName: "envelope.fill",
                                                           text: "почта")
    
    private lazy var mainStack = createVerticalStackView(spacing: 10,
                                                         color: nil)
    
    private lazy var buttonForNumber = createButtonWithSubtitle(firstText: "другой",
                                                                secondText: "8 ")
    private lazy var buttonForNotes = createButtonWithSubtitle(firstText: "заметки",
                                                               secondText: " ")
    
    private lazy var secondaryStack = createVerticalStackView(spacing: 0,
                                                              color: .white)
    
    private lazy var buttonSendMessage = createButtonForActions(text: "Отправить сообщение",
                                                                color: .systemBlue)
    private lazy var buttonShareContact = createButtonForActions(text: "Поделиться контактом",
                                                                 color: .systemBlue)
    private lazy var buttonAddToFavorites = createButtonForActions(text: "Добавить в избранное",
                                                                   color: .systemBlue)
    
    private lazy var buttonContactForEmergency = createButtonForActions(text: "Добавить контакт на случай ЧП",
                                                                        color: .systemBlue)
    private lazy var buttonGeolocation = createButtonForActions(text: "Поделиться геопозицией",
                                                                color: .systemBlue)
    private lazy var buttonBlocking = createButtonForActions(text: "Заблокировать абонента",
                                                             color: .systemRed)
    
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
        backgroundColor = .systemGroupedBackground
        
        setupHierarchy()
        setupLayouts()
    }
    
    
    // MARK: - Setup
        
    private func setupHierarchy() {
        
        addSubview(contactImageView)
        addSubview(nameLabel)
        
        addSubview(stackForMainButton)
        stackForMainButton.addArrangedSubview(messageMainButton)
        stackForMainButton.addArrangedSubview(anotherMainButton)
        stackForMainButton.addArrangedSubview(videoMainButton)
        stackForMainButton.addArrangedSubview(envelopeMainButton)
        
        addSubview(scrollView)
        scrollView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(buttonForNumber)
        mainStack.addArrangedSubview(buttonForNotes)
        
        mainStack.addArrangedSubview(secondaryStack)
        secondaryStack.addArrangedSubview(buttonSendMessage)
        secondaryStack.addArrangedSubview(buttonShareContact)
        secondaryStack.addArrangedSubview(buttonAddToFavorites)
        
        mainStack.addArrangedSubview(buttonContactForEmergency)
        mainStack.addArrangedSubview(buttonGeolocation)
        mainStack.addArrangedSubview(buttonBlocking)
    }
        
    private func setupLayouts() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        contactImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contactImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        contactImageView.heightAnchor.constraint(equalTo: contactImageView.widthAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contactImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        stackForMainButton.translatesAutoresizingMaskIntoConstraints = false
        stackForMainButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        stackForMainButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackForMainButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: stackForMainButton.bottomAnchor, constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    // MARK: - Private functions for create UI
    
    private func createHorizontalStackView(distribution: UIStackView.Distribution, spacing: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = distribution
        stack.spacing = CGFloat(spacing)
        
        return stack
    }
    
    private func createVerticalStackView(spacing: Int, color: UIColor?) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = CGFloat(spacing)
        if let color = color {
            stack.backgroundColor = color
            stack.layer.cornerRadius = 10
        }
        
        return stack
    }
    
    private func createMainButton(imageName: String, text: String) -> UIButton {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12)

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(text, attributes: container)
        configuration.image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.contentMode = .scaleAspectFill
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        
        return button
    }
    
    private func createButtonWithSubtitle(firstText: String, secondText: String) -> UIButton {
        var firstTextContainer = AttributeContainer()
        firstTextContainer.font = UIFont.systemFont(ofSize: 16)
        
        var secondTextContainer = AttributeContainer()
        secondTextContainer.font = UIFont.systemFont(ofSize: 18)
        secondTextContainer.foregroundColor = .systemBlue

        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(firstText, attributes: firstTextContainer)
        configuration.attributedSubtitle = AttributedString(secondText, attributes: secondTextContainer)
        configuration.titlePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .leading
        
        return button
    }
    
    private func createButtonForActions(text: String, color: UIColor) -> UIButton {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18)
        container.foregroundColor = color

        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(text, attributes: container)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        configuration.baseBackgroundColor = .white
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .leading
        
        return button
    }
    
    // MARK: - Actions
    
    func addAnotherMainButtonTarget(_ target: Any?, action: Selector) {
        anotherMainButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // MARK: - Public Methods
    
    func setupView(with model: Contact) {
        
        if let image = model.profileImage {
            contactImageView.image = UIImage(named: image)
        }
        if let secondName = model.secondName {
            nameLabel.text = model.firstName + " " + secondName
        } else {
            nameLabel.text = model.firstName
        }
        if let phoneNumber = model.phoneNumber?[0] {
            buttonForNumber.configuration?.subtitle = String(phoneNumber)
        }
    }
}
