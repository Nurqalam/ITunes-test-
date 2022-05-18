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
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
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
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
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
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
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
        
    }
    
    private func setDatePickerSettings() {
        
    }
    
}


// MARK: - setConstraints
extension SignUpViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
