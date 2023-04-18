//
//  EditProfileViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 07.04.2023.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    // MARK: - Properties.
    
    private var stackView = UIStackView()
    private let firstnameTextField = UITextField()
    private let lastnameTextField = UITextField()
    private let saveButton = UIButton(type: .system)
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
            firstnameTextField.backgroundColor = .systemBackground
            lastnameTextField.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .systemBackground
            firstnameTextField.backgroundColor = .secondarySystemBackground
            lastnameTextField.backgroundColor = .secondarySystemBackground
        }
        title = "Edit profile"
    }
    
    // MARK: - Setup iOS theme.
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
            firstnameTextField.backgroundColor = .systemBackground
            lastnameTextField.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .systemBackground
            firstnameTextField.backgroundColor = .secondarySystemBackground
            lastnameTextField.backgroundColor = .secondarySystemBackground
        }
    }
    
    // MARK: - setupViews function.
    
    private func setupViews() {
        setupFirstnameTextField()
        setupLastnameTextField()
        setupSaveButton()
    }
    
    // MARK: - setupFirstnameTextField function.
    
    private func setupFirstnameTextField() {
        view.addSubview(firstnameTextField)
        firstnameTextField.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 16)
        firstnameTextField.pinLeft(to: view.leadingAnchor, 16)
        firstnameTextField.pinRight(to: view.trailingAnchor, 16)
        firstnameTextField.setHeight(to: 50)
        let paddingView = UIView()
        let textLabel = UILabel()
        textLabel.setWidth(to: 80)
        textLabel.setHeight(to: 40)
        paddingView.addSubview(textLabel)
        textLabel.pinTop(to: paddingView, 5)
        textLabel.pinBottom(to: paddingView, 5)
        textLabel.pinLeft(to: paddingView, 10)
        textLabel.pinRight(to: paddingView, 5)
        textLabel.text = "Name:"
        textLabel.textAlignment = .left
        textLabel.textColor = .label
        textLabel.font = .systemFont(ofSize: 18, weight: .medium)
        firstnameTextField.leftView = paddingView
        firstnameTextField.leftViewMode = .always
        firstnameTextField.text = "User Name"
        firstnameTextField.backgroundColor = .systemBackground
        firstnameTextField.layer.cornerRadius = 10
        firstnameTextField.keyboardType = UIKeyboardType.default
        firstnameTextField.returnKeyType = UIReturnKeyType.done
        firstnameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
    }
    
    // MARK: - setupLastnameTextField function.
    
    private func setupLastnameTextField() {
        view.addSubview(lastnameTextField)
        lastnameTextField.pinTop(to: firstnameTextField.bottomAnchor, 10)
        lastnameTextField.pinLeft(to: view.leadingAnchor, 16)
        lastnameTextField.pinRight(to: view.trailingAnchor, 16)
        lastnameTextField.setHeight(to: 50)
        let paddingView = UIView()
        let textLabel = UILabel()
        textLabel.setWidth(to: 80)
        textLabel.setHeight(to: 40)
        paddingView.addSubview(textLabel)
        textLabel.pinTop(to: paddingView, 5)
        textLabel.pinBottom(to: paddingView, 5)
        textLabel.pinLeft(to: paddingView, 10)
        textLabel.pinRight(to: paddingView, 5)
        textLabel.text = "Surname:"
        textLabel.textAlignment = .left
        textLabel.textColor = .label
        textLabel.font = .systemFont(ofSize: 18, weight: .medium)
        lastnameTextField.leftView = paddingView
        lastnameTextField.leftViewMode = .always
        lastnameTextField.text = "User Surname"
        lastnameTextField.backgroundColor = .systemBackground
        lastnameTextField.layer.cornerRadius = 10
        lastnameTextField.keyboardType = UIKeyboardType.default
        lastnameTextField.returnKeyType = UIReturnKeyType.done
        lastnameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
    }

    // MARK: - setupSaveButton function.
    
    private func setupSaveButton() {
        view.addSubview(saveButton)
        saveButton.setTitle("Save changes", for: .normal)
        saveButton.configuration = .filled()
        saveButton.configuration?.cornerStyle = .medium
        saveButton.setHeight(to: 50)
        saveButton.pinTop(to: lastnameTextField.bottomAnchor, 10)
        saveButton.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, 16)
        saveButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, 16)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func saveButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}
