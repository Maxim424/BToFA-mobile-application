//
//  PaymentCalendarWidget.swift
//  Application
//
//  Created by Максим Кузнецов on 09.03.2023.
//

import UIKit

final class PaymentCalendarWidget: UITableViewCell {
    
    // MARK: - Properties.
    
    static let reuseIdentifier = "PaymentCalendarWidget"
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layoutSubviews function.
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    // MARK: - Views setup.
    
    private func setupViews() {
        contentView.isUserInteractionEnabled = true
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
        
        headerLabel.text = "Календарь выплат"
        headerLabel.textAlignment = .left
        headerLabel.font = .systemFont(ofSize: 24, weight: .medium)
        headerLabel.textColor = .label
    }

    
    // MARK: - TableView setup.
        
    private func setupTableView() {
        tableView.register(PaymentCalendarTableViewCell.self, forCellReuseIdentifier: PaymentCalendarTableViewCell.reuseIdentifier)
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
        self.addSubview(tableView)
        tableView.pinTop(to: headerLabel.bottomAnchor, 16)
        tableView.pinBottom(to: self.bottomAnchor)
        tableView.pinLeft(to: self.leadingAnchor, 13)
        tableView.pinRight(to: self.trailingAnchor, 13)
    }

}

// MARK: - Delegate extension.

extension PaymentCalendarWidget: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


// MARK: - DataSource extension.

extension PaymentCalendarWidget: UITableViewDataSource {
    
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
        return 40
    }
    
    // MARK: - Setup cells.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        default:
            if let calendarCell = tableView.dequeueReusableCell(withIdentifier: PaymentCalendarTableViewCell.reuseIdentifier, for: indexPath) as? PaymentCalendarTableViewCell {
                
                
                return calendarCell
            }
        }
        
        return UITableViewCell()
    }
}


