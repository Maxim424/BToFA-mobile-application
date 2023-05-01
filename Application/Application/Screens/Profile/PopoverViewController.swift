//
//  PopoverViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 28.04.2023.
//

import UIKit

final class PopoverViewController: UIViewController {
    
    // MARK: - Properties.
    
    let infoLabel = UILabel()
    
    // MARK: - viewDidLoad function.

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
    
    // MARK: - Setup View.
    
    private func setupView() {
        view.addSubview(infoLabel)
        infoLabel.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor)
        infoLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        infoLabel.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor)
        infoLabel.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        infoLabel.backgroundColor = .clear
        infoLabel.font = .systemFont(ofSize: 14, weight: .medium)
        infoLabel.textColor = .label
        infoLabel.textAlignment = .center
    }
    
    // MARK: - setText function.
    
    public func setText(text: String) {
        infoLabel.text = text
    }
}
