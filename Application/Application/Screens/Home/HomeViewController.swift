//
//  ViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 28.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties.
    
    private let accountBalanceWidget = AccountBalanceWidget()

    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.title = "Главная"
    }
    
    // MARK: - Setup StatusBar.
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Setup Views.
    
    private func setupViews() {
        setupAccountBalanceWidget()
    }
    
    // MARK: - Setup AccountBalanceWidget.
    
    private func setupAccountBalanceWidget() {
        view.addSubview(accountBalanceWidget)
        accountBalanceWidget.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        accountBalanceWidget.pinLeft(to: view)
        accountBalanceWidget.pinRight(to: view)
        accountBalanceWidget.setHeight(to: 200)
        
        accountBalanceWidget.transactionLogButton.addTarget(self, action: #selector(transactionLogButtonPressed), for: .touchUpInside)
        accountBalanceWidget.putMoneyButton.addTarget(self, action: #selector(putMoneyButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func transactionLogButtonPressed() {
        let transactionLogViewController = TransactionLogViewController()
        navigationController?.pushViewController(transactionLogViewController, animated: true)
    }
    
    @objc
    private func putMoneyButtonPressed() {
        let putMoneyViewController = PutMoneyViewController()
        navigationController?.pushViewController(putMoneyViewController, animated: true)
    }
}

