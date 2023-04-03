//
//  CalendarViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 03.04.2023.
//

import UIKit

class CalendarViewController: UIViewController {
    
    // MARK: - viewDidLoad function.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupNavBar()
    }
    
    // MARK: - viewWillAppear function.

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Calendar"
    }
    
    // MARK: - setupNavBar function.
    
    private func setupNavBar() {
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}


