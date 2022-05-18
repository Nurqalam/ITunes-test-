//
//  SignUpViewController.swift
//  ITunesProjectTest
//
//  Created by Nurqalam on 18.05.2022.
//

import Foundation
import UIKit


class SignUpViewController: UIViewController {
    
    private let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textColor = #colorLiteral(red: 1, green: 0.3582252628, blue: 0.5298528344, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Second Name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let phoneNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Reqauired field"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignUP", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.3582252628, blue: 0.5298528344, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var stackView = UIStackView()
    private let datePicker = UIDatePicker()
    

    @objc private func signUpButtonPressed() {
        print("SignUP")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        setDatePickerSettings()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(registrationLabel)
        
        stackView = UIStackView(arrangedSubviews: [firstNameTextField,
                                                  firstNameLabel,
                                                  secondNameTextField,
                                                  secondNameLabel,
                                                  datePicker,
                                                  datePickerLabel,
                                                  phoneTextField,
                                                  phoneNameLabel,
                                                  emailTextField,
                                                  emailNameLabel,
                                                  passwordTextField,
                                                  passwordNameLabel],
                                axis: .vertical,
                                spacing: 10,
                                distribuiton: .fillProportionally)
        
        view.addSubview(stackView)
        view.addSubview(signUpButton)
    }
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setDatePickerSettings() {
        datePicker.isHighlighted = .random()
        datePicker.datePickerMode = .date
//        datePicker.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        datePicker.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        datePicker.layer.borderWidth = 1
        datePicker.layer.cornerRadius = 6
        datePicker.tintColor = .black
        datePicker.semanticContentAttribute = .forceRightToLeft
        datePicker.subviews.first?.semanticContentAttribute = .forceRightToLeft
    }

}


// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}


// MARK: - setConstraints
extension SignUpViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 90),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
}
