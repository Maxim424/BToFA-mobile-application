//
//  TokensWidget.swift
//  Application
//
//  Created by Максим Кузнецов on 07.03.2023.
//

import UIKit

final class TokensWidget: UIView {
    
    // MARK: - Properties.
    
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    
    // MARK: - Initialization
      
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views setup.
    
    private func setupViews() {
        backgroundColor = .systemBackground
        self.layer.cornerRadius = 15
        setupHeaderLabel()
        setupTableView()
        tableView.dataSourceIndexPath(forPresentationIndexPath: IndexPath(index: 0))
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.pinTop(to: self, 16)
        headerLabel.pinLeft(to: self, 16)
        
        headerLabel.text = "Портфель"
        headerLabel.textAlignment = .left
        headerLabel.font = .systemFont(ofSize: 24, weight: .medium)
        headerLabel.textColor = .label
    }

    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(TokenTableViewCell.self, forCellReuseIdentifier: TokenTableViewCell.reuseIdentifier)
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
        tableView.separatorColor = UIColor.clear;
    }
    
    private func setupTableViewPosition() {
        self.addSubview(tableView)
        tableView.pinTop(to: headerLabel.bottomAnchor, 16)
        tableView.pinBottom(to: self.bottomAnchor)
        tableView.pinLeft(to: self.leadingAnchor, 13)
        tableView.pinRight(to: self.trailingAnchor, 13)
    }

}

// MARK: - Delegate extension.

extension TokensWidget: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


// MARK: - DataSource extension.

extension TokensWidget: UITableViewDataSource {
    
    // MARK: - Setup number of sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Events number.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // MARK: - Setup event card height.
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // MARK: - Setup event cards.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        default:
            if let tokenCell = tableView.dequeueReusableCell(withIdentifier: TokenTableViewCell.reuseIdentifier, for: indexPath) as? TokenTableViewCell {
                
                
                return tokenCell
            }
        }
        
        return UITableViewCell()
    }
}

