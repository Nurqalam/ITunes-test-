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
    
    
    let nameValidType: String.ValidTypes = .name
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password
    
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
        datePicker.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        datePicker.layer.borderWidth = 1
        datePicker.layer.cornerRadius = 6
        datePicker.tintColor = .black
        datePicker.semanticContentAttribute = .forceRightToLeft
        datePicker.subviews.first?.semanticContentAttribute = .forceRightToLeft
    }

    
    @objc private func signUpButtonPressed() {
        
        let firstNameText = firstNameTextField.text ?? ""
        let secondNameText = secondNameTextField.text ?? ""
        let phoneText = phoneTextField.text ?? ""
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        if firstNameText.isValid(validType: nameValidType)
            && secondNameText.isValid(validType: nameValidType)
            && phoneText.count == 18
            && emailText.isValid(validType: emailValidType)
            && passwordText.isValid(validType: passwordValidType)
            && ageisValid() == true {
            
            DataBase.shared.saveUser(firstName: firstNameText,
                                     secondName: secondNameText,
                                     phone: phoneText,
                                     email: emailText,
                                     password: passwordText,
                                     age: datePicker.date)
            
            registrationLabel.text = "Registration completed!"
        } else {
            registrationLabel.text = "Registration"
            alertOk(title: "Error", message: "Fill in all the fields and your age must be 18+")
        }
        
        
    }

    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            label.text = wrongMessage
            label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    
    private func setPhoneNumberMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        
        guard let text = textField.text else {
            return ""
        }
        
        let phone = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]",
                                                with: "",
                                                options: .regularExpression,
                                                range: .none)
        var result = ""
        var index = number.startIndex
        
        for chars in mask where index < number.endIndex {
            if chars == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(chars)
            }
        }
        
        if result.count == 18 {
            phoneNameLabel.text = "Phone is Valid"
            phoneNameLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            phoneNameLabel.text = "Phone is Not Valid"
            phoneNameLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        return result
    }
    
    private func ageisValid() -> Bool {
        let calendar = NSCalendar.current
        let dateNow = Date()
        let birthday = datePicker.date
        
        let age = calendar.dateComponents([.year], from: birthday, to: dateNow)
        let ageYear = age.year
        guard let ageUser = ageYear else {return false}
        return (ageUser < 18 ? false : true)
    }
}


// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case firstNameTextField: setTextField(textField: firstNameTextField,
                                              label: firstNameLabel,
                                              validType: nameValidType,
                                              validMessage: "Name is valid",
                                              wrongMessage: "Only A-Z characters, min 1 character",
                                              string: string,
                                              range: range)
            
        case secondNameTextField: setTextField(textField: secondNameTextField,
                                              label: secondNameLabel,
                                              validType: nameValidType,
                                              validMessage: "Name is valid",
                                              wrongMessage: "Only A-Z characters, min 1 character",
                                              string: string,
                                              range: range)
            
        case emailTextField: setTextField(textField: emailTextField,
                                              label: emailNameLabel,
                                              validType: emailValidType,
                                              validMessage: "Email is valid",
                                              wrongMessage: "Email is Not valid",
                                              string: string,
                                              range: range)
            
        case passwordTextField: setTextField(textField: passwordTextField,
                                              label: passwordNameLabel,
                                              validType: passwordValidType,
                                              validMessage: "Password is valid",
                                              wrongMessage: "Password is Not valid",
                                              string: string,
                                              range: range)

        case phoneTextField: phoneTextField.text = setPhoneNumberMask(textField: phoneTextField,
                                                                      mask: "+X (XXX) XXX XX XX",
                                                                      string: string,
                                                                      range: range)


        default:
            break
        }
        
        return false
    }
    
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
