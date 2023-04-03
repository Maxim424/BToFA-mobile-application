//
//  TransactionLogViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 03.03.2023.
//

import UIKit

class TransactionLogViewController: UIViewController {
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
        title = "Transactions history"
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
    
    // MARK: - setupNavBar function.
    
    private func setupNavBar() {
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
