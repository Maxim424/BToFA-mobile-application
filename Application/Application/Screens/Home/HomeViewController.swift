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
        setupTableView()
    }
    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(AccountBalanceWidget.self, forCellReuseIdentifier: AccountBalanceWidget.reuseIdentifier)
        tableView.register(TokensWidget.self, forCellReuseIdentifier: TokensWidget.reuseIdentifier)
        tableView.register(PaymentCalendarWidget.self, forCellReuseIdentifier: PaymentCalendarWidget.reuseIdentifier)
        setupTableViewAppearance()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.isUserInteractionEnabled = true
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
    
    @objc
    private func transactionLogButtonPressed() {
        let transactionLogViewController = TransactionLogViewController()
        let navController = UINavigationController(rootViewController: transactionLogViewController)
        navigationController?.present(navController, animated: true)
//        navigationController?.pushViewController(transactionLogViewController, animated: true)
    }
    
    @objc
    private func putMoneyButtonPressed() {
        let putMoneyViewController = PutMoneyViewController()
        let navController = UINavigationController(rootViewController: putMoneyViewController)
        navigationController?.present(navController, animated: true)
//        navigationController?.pushViewController(putMoneyViewController, animated: true)
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
                accountWidgetCell.isUserInteractionEnabled = true
                accountWidgetCell.putMoneyButton.addTarget(self, action: #selector(putMoneyButtonPressed), for: .touchUpInside)
                accountWidgetCell.transactionLogButton.addTarget(self, action: #selector(transactionLogButtonPressed), for: .touchUpInside)
                setBorders(cell: accountWidgetCell)
                return accountWidgetCell
            }
        case 1:
            if let tokensWidget = tableView.dequeueReusableCell(withIdentifier: TokensWidget.reuseIdentifier, for: indexPath) as? TokensWidget {
                tokensWidget.isUserInteractionEnabled = true
                setBorders(cell: tokensWidget)
                return tokensWidget
            }
        case 2:
            if let paymentCalendarWidget = tableView.dequeueReusableCell(withIdentifier: PaymentCalendarWidget.reuseIdentifier, for: indexPath) as? PaymentCalendarWidget {
                paymentCalendarWidget.isUserInteractionEnabled = true
                setBorders(cell: paymentCalendarWidget)
                return paymentCalendarWidget
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    private func setBorders(cell: UITableViewCell) {
        cell.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        cell.layer.borderWidth = 5
        cell.clipsToBounds = true
    }
}



