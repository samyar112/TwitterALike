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
    
    private lazy var loginButton: UIButton = {
        let loginButton = Utilities().primaryButton(with: "Log In")
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return loginButton
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton(with: "Don't have an account?", and: " Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.userLogin(withEmail: email, password: password) { [ weak self ] (result, error) in
            
            if let error = error {
                print("DEBUG: Error logging in \(error.localizedDescription)")
                return
            }

            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            guard let tab = window.rootViewController as? MainTabController else { return }
            
            tab.authenticateUserAndConfigureUI()
            
            self?.dismiss(animated: true)
        }
    }
    
    @objc func handleSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top:logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 24, paddingRight: 24)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingRight: 15)
    }
}
