//
//  ViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 28.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties.
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        tableView.reloadData()
    }
    
    // MARK: - Setup StatusBar.
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - setupNavBar function.
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor: UIColor.secondarySystemBackground]
    }
    
    // MARK: - Setup Views.
    
    private func setupViews() {
        setupTableView()
    }
    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "widgetCell")
        setupTableViewAppearance()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
//        tableView.isUserInteractionEnabled = true
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
    }
    
    @objc
    private func putMoneyButtonPressed() {
        let putMoneyViewController = PutMoneyViewController()
        let navController = UINavigationController(rootViewController: putMoneyViewController)
        navigationController?.present(navController, animated: true)
    }
    
    @objc
    private func profileButtonPressed() {
        let profileViewController = ProfileViewController()
        let navController = UINavigationController(rootViewController: profileViewController)
        navigationController?.present(navController, animated: true)
    }
}

// MARK: - Delegate extension.

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                let transactionLogViewController = TransactionLogViewController()
                navigationController?.pushViewController(transactionLogViewController, animated: true)
            } else if indexPath.row == 2 {
                let putMoneyViewController = PutMoneyViewController()
                navigationController?.pushViewController(putMoneyViewController, animated: true)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let myTokensViewController = MyTokensViewController()
                navigationController?.pushViewController(myTokensViewController, animated: true)
            } else if indexPath.row == 1 {
                let calendarViewController = CalendarViewController()
                navigationController?.pushViewController(calendarViewController, animated: true)
            }
        }
    }
}

// MARK: - DataSource extension.

extension HomeViewController : UITableViewDataSource {
    
    // MARK: - Setup number of sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - Setup cells number.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    // MARK: - Setup cell height.
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 80
        }
        return 50
    }
    
    // MARK: - Setup cells.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.image = UIImage(systemName: "briefcase.circle.fill")
                content.text = "Account"
                content.secondaryText = "1000 ₽"
                content.textProperties.font = .boldSystemFont(ofSize: 18)
                content.secondaryTextProperties.font = .systemFont(ofSize: 18)
                cell.contentConfiguration = content
                return UITableViewCell()
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Transactions history"
                content.image = UIImage(systemName: "clock.fill")
                cell.contentConfiguration = content
                return UITableViewCell()
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Put money"
                content.image = UIImage(systemName: "dollarsign.circle.fill")
                cell.contentConfiguration = content
                return UITableViewCell()
            }
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "My tokens"
                content.image = UIImage(systemName: "t.circle.fill")
                cell.contentConfiguration = content
                return UITableViewCell()
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Calendar"
                content.image = UIImage(systemName: "calendar.circle.fill")
                cell.contentConfiguration = content
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
