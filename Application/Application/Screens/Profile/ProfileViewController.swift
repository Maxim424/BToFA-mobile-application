//
//  ProfileViewController.swift
//  Application
//
//  Created by Максим Кузнецов on 01.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor: UIColor.secondarySystemBackground]
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
