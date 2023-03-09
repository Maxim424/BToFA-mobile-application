//
//  PaymentCalendarTableViewCell.swift
//  Application
//
//  Created by Максим Кузнецов on 09.03.2023.
//

import UIKit

// MARK: - PaymentCalendarTableViewCell class.

final class PaymentCalendarTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PaymentCalendarTableViewCell"
    private let iconView = UIImageView(image: UIImage(systemName: "calendar.circle"))
    private let headerLabel = UILabel()
    private let datetimeLabel = UILabel()
    private let percentButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        setupImage()
        setupDatetimeLabel()
        setupHeaderLabel()
        setupPercentButton()
    }
    
    private func setupImage() {
        addSubview(iconView)
        iconView.pinLeft(to: self)
        iconView.pinCenterY(to: self)
        iconView.setHeight(to: 30)
        iconView.setWidth(to: 30)
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.pinLeft(to: self.centerXAnchor)
        headerLabel.pinCenterY(to: self)

        headerLabel.text = "Token 1"
        headerLabel.textAlignment = .right
        headerLabel.font = .systemFont(ofSize: 16, weight: .medium)
        headerLabel.textColor = .systemGray
    }
    
    private func setupDatetimeLabel() {
        addSubview(datetimeLabel)
        datetimeLabel.pinLeft(to: iconView.trailingAnchor, 16)
        datetimeLabel.pinCenterY(to: self)
        datetimeLabel.pinRight(to: self.centerXAnchor)
        
        datetimeLabel.text = "13.01.2024"
        datetimeLabel.textAlignment = .left
        datetimeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        datetimeLabel.textColor = .label
    }
    
    private func setupPercentButton() {
        addSubview(percentButton)
        percentButton.configuration = .filled()
        percentButton.configuration?.title = "+12%"
        percentButton.configuration?.cornerStyle = .capsule
        percentButton.configuration?.attributedTitle = AttributedString((percentButton.configuration?.title)!, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]))
        
        percentButton.setHeight(to: 25)
        percentButton.setWidth(to: 70)
        percentButton.pinRight(to: self, 16)
        percentButton.pinCenterY(to: self)
    }
}


