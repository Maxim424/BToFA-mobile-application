////
////  TokenTableViewCell.swift
////  Application
////
////  Created by Максим Кузнецов on 07.03.2023.
////
//
//import UIKit
//
//// MARK: - TokenTableViewCell class.
//
//final class TokenTableViewCell: UITableViewCell {
//
//    static let reuseIdentifier = "TokenTableViewCell"
//    private let iconView = UIImageView(image: UIImage(systemName: "bitcoinsign.circle"))
//    private let headerLabel = UILabel()
//    private let datetimeLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none
//        setupViews()
//    }
//    
//    @available (*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        contentView.isUserInteractionEnabled = true
//        backgroundColor = .clear
//        setupImage()
//        setupHeaderLabel()
//        setupDatetimeLabel()
//    }
//
//    private func setupImage() {
//        addSubview(iconView)
//        iconView.pinLeft(to: self)
//        iconView.pinCenterY(to: self)
//        iconView.setHeight(to: 30)
//        iconView.setWidth(to: 30)
//    }
//
//    private func setupHeaderLabel() {
//        addSubview(headerLabel)
//        headerLabel.pinLeft(to: iconView.trailingAnchor, 16)
//        headerLabel.pinCenterY(to: self)
//
//        headerLabel.text = "Token 1: 23"
//        headerLabel.textAlignment = .left
//        headerLabel.font = .systemFont(ofSize: 16, weight: .medium)
//        headerLabel.textColor = .label
//    }
//
//    private func setupDatetimeLabel() {
//        addSubview(datetimeLabel)
//        datetimeLabel.pinRight(to: self, 16)
//        datetimeLabel.pinCenterY(to: self)
//
//        datetimeLabel.text = "выпущен: 13.01.2023"
//        datetimeLabel.textAlignment = .right
//        datetimeLabel.font = .systemFont(ofSize: 16, weight: .medium)
//        datetimeLabel.textColor = .systemGray
//    }
//}
//
