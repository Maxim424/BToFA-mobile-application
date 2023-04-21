//
//  ProfileViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 01.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties.
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - viewDidLoad function.

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        tableView.reloadData()
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
        navigationController?.navigationBar.topItem?.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Setup Views.
    
    private func setupViews() {
        if traitCollection.userInterfaceStyle == .light {
            view.backgroundColor = .secondarySystemBackground
        } else {
            view.backgroundColor = .systemBackground
        }
        setupTableView()
    }
    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "profileCell")
        setupTableViewAppearance()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.allowsMultipleSelection = false
        setupTableViewPosition()
    }
    
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
}

// MARK: - Delegate extension.

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                let editProfileViewController = EditProfileViewController()
                navigationController?.pushViewController(editProfileViewController, animated: true)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let setupNotificationsViewController = SetupNotificationsViewController()
                navigationController?.pushViewController(setupNotificationsViewController, animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(
                    UINavigationController(
                        rootViewController: WelcomeViewController()
                    )
                )
            }
        }
    }
}

// MARK: - DataSource extension.

extension ProfileViewController : UITableViewDataSource {
    
    // MARK: - Setup number of sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: - Setup cells number.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.image = UIImage(systemName: "person.crop.circle.fill")
                content.text = "Name Surname"
                content.secondaryText = "email@email.com"
                content.textProperties.font = .boldSystemFont(ofSize: 18)
                content.secondaryTextProperties.font = .systemFont(ofSize: 18)
                cell.accessoryType = .none
                cell.selectionStyle = .none
                cell.contentConfiguration = content
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
                customizeCell(cell: cell, text: "Edit profile", image: UIImage(systemName: "pencil.circle.fill")!)
                return cell
            }
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
                customizeCell(cell: cell, text: "Setup notifications", image: UIImage(systemName: "bell.circle.fill")!)
                return cell
            }
        case 2:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
                customizeCell(cell: cell, text: "Log out", image: UIImage(systemName: "rectangle.portrait.and.arrow.right")!)
                cell.accessoryType = .none
                cell.contentView.tintColor = .red
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    private func customizeCell(cell: UITableViewCell, text: String, image: UIImage) {
        var content = cell.defaultContentConfiguration()
        content.text = text
        content.image = image
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.contentView.tintColor = .tintColor
    }
}

