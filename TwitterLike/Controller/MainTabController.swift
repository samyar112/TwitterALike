//
//  MainTabController.swift
//  TwitterLike
//
//  Created by Samir Pandey on 2/8/23.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Properties
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }

    // MARK: - Helpers
    
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let navigationOne = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExplorerController()
        let navigationTwo = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let navigationThree = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
       
        
        let conversations = ConversationsController()
        let navigationFour = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        
        viewControllers = [navigationOne,
                           navigationTwo,
                           navigationThree,
                           navigationFour]
        
        // Disabling automatic transparent tabBar.
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {

        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.image = image
       
        // custom navigation bar color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigation.navigationBar.standardAppearance = appearance
        navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
    
        return navigation
    }
}
