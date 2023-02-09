//
//  RegistrationController.swift
//  TwitterALike
//
//  Created by Samir Pandey on 2/8/23.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:  "plus_photo" ), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        
        return button
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
    
    private lazy var fullNameContainerView: UIView = {
        
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)
        
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image, textField: usernameTextField)
        
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
    
    private let fullNameTextField: UITextField = {
        let placeholderText = "Full Name"
        let textField = Utilities().textField(withPlaceholder: placeholderText)
        
        return textField
    }()
    
    private let usernameTextField: UITextField = {
        let placeholderText = "Username"
        let textField = Utilities().textField(withPlaceholder: placeholderText)
        
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = Utilities().primaryButton(with: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton(with: "Already have an account?", and: " Sign In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
        
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleSignUp() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   fullNameContainerView,
                                                   usernameContainerView,
                                                   signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top:plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24 ,paddingLeft: 24, paddingRight: 24)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingRight: 15)
    }
}

// MARK: UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        plusPhotoButton.layer.cornerRadius = 150 / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFit
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
