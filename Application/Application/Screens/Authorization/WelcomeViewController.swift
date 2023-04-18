//
//  WelcomeScreenViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 18.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties.
    
    private let signButton = UIButton(type: .system)
    private let titleLabel = UILabel()
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
    }
    
    // MARK: - Setup StatusBar.
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Setup iOS theme.
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
    }
    
    // MARK: - Setup Views.
    
    private func setupViews() {
        setupTitleLabeL()
        setupSignButton()
    }
    
    // MARK: - Setup Views.
    
    private func setupTitleLabeL() {
        view.addSubview(titleLabel)
        titleLabel.pinCenterY(to: view)
        titleLabel.pinLeft(to: view, 16)
        titleLabel.text = "Blockchain\nTokenization of\nFinantial Assets"
        titleLabel.numberOfLines = .zero
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    // MARK: - Setup Views.
    
    private func setupSignButton() {
        view.addSubview(signButton)
        signButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 75)
        signButton.pinLeft(to: view, 16)
        signButton.pinRight(to: view, 16)
        signButton.setHeight(to: 50)
        signButton.configuration = .filled()
        signButton.configuration?.cornerStyle = .capsule
        signButton.setTitle("Sign in", for: .normal)
        signButton.addTarget(self, action: #selector(signButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func signButtonPressed() {
        let enterEmailViewController = EnterEmailViewController()
        let navController = UINavigationController(rootViewController: enterEmailViewController)
        navigationController?.pushViewController(enterEmailViewController, animated: true)
    }
}
