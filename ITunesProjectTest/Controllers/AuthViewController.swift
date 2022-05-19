//
//  ViewController.swift
//  ITunesProjectTest
//
//  Created by Nurqalam on 17.05.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let iTunesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "itunes-logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email here..."
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password here..."
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignIN", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.06176952387, green: 0.7314106589, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private let producedLabel: UILabel = {
        let label = UILabel()
        label.text = "Produced by Apple 2022."
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        label.alpha = 0.4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var textFeildsStackView = UIStackView()
    private var buttonsStackView = UIStackView()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
    }

    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(iTunesImageView)
        
        textFeildsStackView = UIStackView(arrangedSubviews: [emailTextField,
                                                            passwordTextField],
                                          axis: .vertical,
                                          spacing: 20,
                                          distribuiton: .fillProportionally)
        buttonsStackView = UIStackView(arrangedSubviews: [signInButton,
                                                         signUpButton],
                                       axis: .horizontal,
                                       spacing: 25,
                                       distribuiton: .fillEqually)
        
        view.addSubview(textFeildsStackView)
        view.addSubview(buttonsStackView)
        view.addSubview(producedLabel)
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    @objc private func signInButtonPressed() {
        
        let mail = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        let user = findUserDataBase(mail: mail)
        
        if user == nil {
            print("User Not found")
        } else if user?.password == pass {
            let navVC = UINavigationController(rootViewController: AlbumsViewController())
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true)
            
            guard let activeUser = user else {return}
            DataBase.shared.saveActiveUser(user: activeUser)
            
        } else {
            print("Wrong password")
        }
    }
    
    @objc private func signUpButtonPressed() {
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true)
    }
    
    
    private func findUserDataBase(mail: String) -> User? {
        
        let dataBase = DataBase.shared.users
        print(dataBase)
        
        for user in dataBase {
            if user.email == mail {
                return user
            }
        }
        
        return nil
    }
}


// MARK: - UITextFieldDelegate
extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}


// MARK: - setConstraints
extension AuthViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iTunesImageView.bottomAnchor.constraint(equalTo: textFeildsStackView.topAnchor, constant: -90),
            iTunesImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textFeildsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            textFeildsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textFeildsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: textFeildsStackView.bottomAnchor, constant: 30),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        
        NSLayoutConstraint.activate([
            producedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            producedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

