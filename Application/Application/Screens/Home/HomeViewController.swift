//
//  ViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 28.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties.
    
    private let tableView = UITableView()
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
//        setupAccountBalanceWidget()
//        setupTokensWidget()
//        setupPaymentCalendarWidget()
        setupTableView()
    }
    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(AccountBalanceWidget.self, forCellReuseIdentifier: AccountBalanceWidget.reuseIdentifier)
        setupTableViewAppearance()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        setupTableViewPosition()
    }
    
    // MARK: - TableView setup.
    
    private func setupTableViewAppearance() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupTableViewPosition() {
        view.addSubview(tableView)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pinLeft(to: view)
        tableView.pinRight(to: view)
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

// MARK: - Delegate extension.

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


// MARK: - DataSource extension.

extension HomeViewController: UITableViewDataSource {
    
    // MARK: - Setup number of sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Cells number.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // MARK: - Setup cell height.
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 166
        } else {
            return 200
        }
    }
    
    // MARK: - Setup cells.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let accountWidgetCell = tableView.dequeueReusableCell(withIdentifier: AccountBalanceWidget.reuseIdentifier, for: indexPath) as? AccountBalanceWidget {
                return accountWidgetCell
            }
        case 1:
            if let accountWidgetCell = tableView.dequeueReusableCell(withIdentifier: AccountBalanceWidget.reuseIdentifier, for: indexPath) as? AccountBalanceWidget {
                return accountWidgetCell
            }
        case 2:
            if let accountWidgetCell = tableView.dequeueReusableCell(withIdentifier: AccountBalanceWidget.reuseIdentifier, for: indexPath) as? AccountBalanceWidget {
                return accountWidgetCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}



