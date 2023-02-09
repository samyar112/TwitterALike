//
//  LoginController.swift
//  TwitterALike
//
//  Created by Samir Pandey on 2/8/23.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "TwitterLogo")
        logoImage.contentMode = .scaleAspectFit
        logoImage.clipsToBounds = true
        
        return logoImage
    }()
    
    private lazy var emailContainerView: UIView = {
        let image =  UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
        view.backgroundColor = .twitterBlue
       
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
        
        return view
    }()
    
    private let emailTextField: UITextField = {
        let placeholderText = "Email"
        let textField = Utilities().textField(withPlaceholder: placeholderText)
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let placeholderText = "Password"
        let textField = Utilities().textField(withPlaceholder: placeholderText)
        textField.isSecureTextEntry = true 
        
        return textField
    }()
    
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top:logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 24, paddingRight: 24)
        
    }

}