//
//  BuyTokenViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 12.04.2023.
//

import UIKit

class BuyTokenViewController: UIViewController {
    
    // MARK: - Properties.
    
    private let infoLabel = UILabel()
    private let buyButton = UIButton(type: .system)
    
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
    
    // MARK: - Setup iOS theme.
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
    }
    
    // MARK: - setupViews function.
    
    private func setupViews() {
        setupInfoLabel()
        setupBuyButton()
    }
    
    private func setupInfoLabel() {
        view.addSubview(infoLabel)
        infoLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        infoLabel.pinLeft(to: view, 16)
        infoLabel.pinRight(to: view, 16)
        infoLabel.textAlignment = .left
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = .zero
        infoLabel.textColor = .label
        infoLabel.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private func setupBuyButton() {
        view.addSubview(buyButton)
        buyButton.pinTop(to: infoLabel.bottomAnchor, 10)
        buyButton.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, 16)
        buyButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, 16)
        buyButton.setHeight(to: 50)
        buyButton.setTitle("Buy", for: .normal)
        buyButton.configuration = .filled()
        buyButton.configuration?.cornerStyle = .medium
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func buyButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    public func configure(model: TokenModel) {
        title = model.name
        infoLabel.text = "Here will be all the necessary information about the \(model.name ?? "token")"
    }
}
