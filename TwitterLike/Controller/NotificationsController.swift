//
//  NotificationsController.swift
//  TwitterLike
//
//  Created by Samir Pandey on 2/8/23.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    
    }
}
