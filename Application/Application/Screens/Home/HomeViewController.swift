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
    private let tokensWidget = TokensWidget()
    private let paymentCalendarWidget = PaymentCalendarWidget()

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
        setupTokensWidget()
        setupPaymentCalendarWidget()
    }
    
    // MARK: - Setup AccountBalanceWidget.
    
    private func setupAccountBalanceWidget() {
        view.addSubview(accountBalanceWidget)
        accountBalanceWidget.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        accountBalanceWidget.pinLeft(to: view)
        accountBalanceWidget.pinRight(to: view)
        accountBalanceWidget.setHeight(to: 166)
        
        accountBalanceWidget.transactionLogButton.addTarget(self, action: #selector(transactionLogButtonPressed), for: .touchUpInside)
        accountBalanceWidget.putMoneyButton.addTarget(self, action: #selector(putMoneyButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Setup TokensWidget.
    
    private func setupTokensWidget() {
        view.addSubview(tokensWidget)
        tokensWidget.pinTop(to: accountBalanceWidget.bottomAnchor, 10)
        tokensWidget.pinLeft(to: view)
        tokensWidget.pinRight(to: view)
        tokensWidget.setHeight(to: 200)
    }
    
    // MARK: - Setup PaymentCalendarWidget.
    
    private func setupPaymentCalendarWidget() {
        view.addSubview(paymentCalendarWidget)
        paymentCalendarWidget.pinTop(to: tokensWidget.bottomAnchor, 10)
        paymentCalendarWidget.pinLeft(to: view)
        paymentCalendarWidget.pinRight(to: view)
        paymentCalendarWidget.setHeight(to: 200)
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

