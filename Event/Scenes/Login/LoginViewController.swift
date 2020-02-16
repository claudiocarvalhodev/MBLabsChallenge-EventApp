//
//  LoginViewController.swift
//  Event
//
//  Created by claudiocarvalho on 14/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "logo-white")
        return image
    }()
    
    private lazy var loginContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .eventGrayLight
        view.layer.cornerRadius = 10

        view.addSubview(loginTitleLabel)
        loginTitleLabel.anchor(top: view.topAnchor, paddingTop: 20)
        loginTitleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton,
                                                   separatorContainerView,
                                                   socialMediaContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: loginTitleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        return view
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an accont? ", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.eventYellow]))
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .eventPurpleDark
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "email-icon"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "password-icon"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var separatorContainerView: UIView = {
        let view = UIView()
        let stack = UIStackView(arrangedSubviews: [separatorRight, orLabel, separatorLeft])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 16
        stack.alignment = .center
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16)
        return view
    }()
    
    private let separatorRight: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.anchor(height: 0.75)
        view.centerY(inView: view)
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.textColor = .eventGray
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()
    
    private let separatorLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.centerY(inView: view)
        view.anchor(height: 0.75)
        return view
    }()
    
    private lazy var socialMediaContainerView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
        let stack = UIStackView(arrangedSubviews: [facebookButton, googleButton, linkedinButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.alignment = .center
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        return view
    }()
    
    private let facebookButton: SocialMediaButton = {
        let button = SocialMediaButton(type: .system)
        button.setImage(UIImage(named: "facebook-icon.png")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleShowFacebookAccess), for: .touchUpInside)
        return button
    }()
    
    private let googleButton: SocialMediaButton = {
        let button = SocialMediaButton(type: .system)
        button.setImage(UIImage(named: "google-icon.png")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleShowGoogleAccess), for: .touchUpInside)
        return button
    }()
    
    private let linkedinButton: SocialMediaButton = {
        let button = SocialMediaButton(type: .system)
        button.setImage(UIImage(named: "linkedin-icon.png")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleShowLinkedinAccess), for: .touchUpInside)
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
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to log user in with error \(error.localizedDescription)")
                return
            }
            guard let controller = UIApplication.shared.keyWindow?.rootViewController as? HomeViewController else { return }
            controller.configureUI()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleShowSignUp() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleShowFacebookAccess() {
        print("Access by Facebook")
    }
    
    @objc func handleShowGoogleAccess() {
        print("Access by Facebook")
    }
    
    @objc func handleShowLinkedinAccess() {
        print("Access by Facebook")
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureNavigationBar()
        view.backgroundColor = .eventPurple
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100, width: 100, height: 100)
        logoImageView.centerX(inView: view)
        
        view.addSubview(loginContainerView)
        loginContainerView.anchor(top: logoImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(top: loginContainerView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 16, height: 32)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}

