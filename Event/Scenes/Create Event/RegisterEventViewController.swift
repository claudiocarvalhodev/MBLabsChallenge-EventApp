//
//  RegisterEventViewController.swift
//  Event
//
//  Created by claudiocarvalho on 17/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class RegisterEventViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        return view
    }()
    
    lazy var scrollViewContainer: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    
    private lazy var createEventInputsContainerView: UIView = {
           let view = UIView()
           view.backgroundColor = .eventGrayLight
           view.layer.cornerRadius = 10

           let stack = UIStackView(arrangedSubviews: [eventNameContainerView,
                                                      descriptionContainerView,
                                                      descriptionContainerView,
                                                      addressContainerView,
                                                      placeContainerView,
                                                      ticketPriceContainerView,
                                                      organizationContainerView,
                                                      createButton])
           stack.axis = .vertical
           stack.distribution = .fillEqually
           stack.spacing = 16
           
           view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
           
           return view
       }()
    
    let eventImageViewWidth: CGFloat = 100
    
    lazy var eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "DefaultProfileImage").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = eventImageViewWidth / 2
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var eventImageButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = eventImageViewWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(eventImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Center of container view"
        return label
    }()
    
    private lazy var eventNameContainerView: UIView = {
        let view = UIView().inputContainerView(textField: eventNameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let eventNameTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Event name *", isSecureTextEntry: false)
    }()
    
    private lazy var descriptionContainerView: UIView = {
        let view = UIView().inputContainerView(textField: descriptionTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let descriptionTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Description *", isSecureTextEntry: true)
    }()
    
    private lazy var dateContainerView: UIView = {
        let view = UIView().inputContainerView(textField: dateTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let dateTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Date *", isSecureTextEntry: true)
    }()
    
    
    private lazy var addressContainerView: UIView = {
        let view = UIView().inputContainerView(textField: addressTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let addressTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Address *", isSecureTextEntry: true)
    }()
    
    private lazy var placeContainerView: UIView = {
        let view = UIView().inputContainerView(textField: placeTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let placeTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Place *", isSecureTextEntry: true)
    }()
    
    private lazy var ticketPriceContainerView: UIView = {
        let view = UIView().inputContainerView(textField: ticketPriceTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let ticketPriceTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Ticket Price *", isSecureTextEntry: true)
    }()
    
    private lazy var organizationContainerView: UIView = {
        let view = UIView().inputContainerView(textField: organizationTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let organizationTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Organization *", isSecureTextEntry: true)
    }()
    
    private let createButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleCreateEvent), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc fileprivate func eventImageButtonTapped() {
        print("Tapped button")
        showChooseSourceTypeAlertController()
        
    }
    
    @objc func handleCreateEvent() {
        print("Create an event.")
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureNavigationBar()
        view.backgroundColor = .eventPurple
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
        scrollViewContainer.addSubview(createEventInputsContainerView)
        createEventInputsContainerView.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingLeft: 16, paddingRight: 16)
        
        setupViews()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    fileprivate func setupViews() {
        addViews()
        constrainViews()
    }
    
    fileprivate func addViews() {
        view.addSubview(eventImageView)
        view.addSubview(eventImageButton)
    }
    
    fileprivate func constrainViews() {
        eventImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 36)
        eventImageView.centerX(inView: view)
        eventImageView.anchor(width: eventImageViewWidth)
        eventImageView.anchor(height: eventImageViewWidth)
    }

}

extension RegisterEventViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showChooseSourceTypeAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Choose a Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a New Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.eventImageView.image = editedImage.withRenderingMode(.alwaysOriginal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.eventImageView.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        dismiss(animated: true, completion: nil)
    }
}
