//
//  ProfileViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 01.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
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

    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
