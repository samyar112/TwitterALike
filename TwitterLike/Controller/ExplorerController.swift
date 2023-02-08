//
//  ExplorerController.swift
//  TwitterLike
//
//  Created by Samir Pandey on 2/8/23.
//

import UIKit

class ExplorerController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
}
