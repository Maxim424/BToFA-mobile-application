//
//  PutMoneyViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 03.03.2023.
//

import UIKit

class PutMoneyViewController: UIViewController {
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupNavBar()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Пополнить баланс"
    }
    
    // MARK: - setupNavBar function.
    
    private func setupNavBar() {
        let closeButton = UIButton(type: .close)
        closeButton.addTarget(self, action: #selector(dismissViewController(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
