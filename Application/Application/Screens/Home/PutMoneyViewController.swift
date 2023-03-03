//
//  PutMoneyViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 03.03.2023.
//

import UIKit

class PutMoneyViewController: UIViewController {
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
//        setupViews()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Пополнить баланс"
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
