//
//  AccountBalanceWidget.swift
//  Application
//
//  Created by Максим Кузнецов on 03.03.2023.
//

import UIKit

class AccountBalanceWidget: UITableViewCell {
    
    // MARK: - Properties.
    
    static let reuseIdentifier = "AccountBalanceWidget"
    private let headerLabel = UILabel()
    private let accountBalanceLabel = UILabel()
    public let transactionLogButton = UIButton(type: .system)
    public let putMoneyButton = UIButton(type: .system)
    
    // MARK: - Initialisers.

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        self.layer.cornerRadius = 15
        
        setupHeaderLabel()
        setupAccountBalanceLabel()
        setupTransactionLogButton()
        setuPutMoneyButton()
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.pinTop(to: self, 16)
        headerLabel.pinLeft(to: self, 16)
        
        headerLabel.text = "Счёт"
        headerLabel.textAlignment = .left
        headerLabel.font = .systemFont(ofSize: 24, weight: .medium)
        headerLabel.textColor = .label
    }
    
    private func setupAccountBalanceLabel() {
        addSubview(accountBalanceLabel)
        accountBalanceLabel.pinTop(to: headerLabel.bottomAnchor, 16)
        accountBalanceLabel.pinLeft(to: self, 16)
        
        accountBalanceLabel.text = "10 000 ₽"
        accountBalanceLabel.textAlignment = .left
        accountBalanceLabel.font = .systemFont(ofSize: 24, weight: .medium)
        accountBalanceLabel.textColor = .label
    }
    
    private func setupTransactionLogButton() {
        addSubview(transactionLogButton)
        transactionLogButton.pinBottom(to: self, 16)
        transactionLogButton.pinLeft(to: self, 16)
        transactionLogButton.pinRight(to: self.centerXAnchor, 8)
        transactionLogButton.setHeight(to: 48)
        
        transactionLogButton.configuration = .filled()
        transactionLogButton.configuration?.cornerStyle = .large
        transactionLogButton.configuration?.imagePlacement = .leading
        transactionLogButton.configuration?.imagePadding = 8.0
        transactionLogButton.configuration?.title = "Журнал\nопераций"
        
        transactionLogButton.configurationUpdateHandler = { transactionLogButton in
          var config = transactionLogButton.configuration
          config?.image = transactionLogButton.isHighlighted ?
            UIImage(systemName: "clock.fill") :
            UIImage(systemName: "clock")
            transactionLogButton.configuration = config
        }
    }
    
    private func setuPutMoneyButton() {
        addSubview(putMoneyButton)
        putMoneyButton.pinBottom(to: self, 16)
        putMoneyButton.pinLeft(to: self.centerXAnchor, 8)
        putMoneyButton.pinRight(to: self, 16)
        putMoneyButton.setHeight(to: 48)
        
        putMoneyButton.configuration = .filled()
        putMoneyButton.configuration?.cornerStyle = .large
        putMoneyButton.configuration?.imagePlacement = .leading
        putMoneyButton.configuration?.imagePadding = 8.0
        putMoneyButton.configuration?.title = "Пополнить\nсчёт"
        
        putMoneyButton.configurationUpdateHandler = { putMoneyButton in
          var config = putMoneyButton.configuration
          config?.image = putMoneyButton.isHighlighted ?
            UIImage(systemName: "dollarsign.circle.fill") :
            UIImage(systemName: "dollarsign.circle")
            putMoneyButton.configuration = config
        }
    }
}
