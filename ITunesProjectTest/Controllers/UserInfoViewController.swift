//
//  UserInfoViewController.swift
//  ITunesProjectTest
//
//  Created by Nurqalam on 18.05.2022.
//

import Foundation
import UIKit


class UserInfoViewController: UIViewController {
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Second Name"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setConstraints()
        setModel()
    }
    
    
    private func setupViews() {
        title = "Active User"
        view.backgroundColor = .white
        
        navigationController?.navigationBar.setNeedsLayout()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

    
        
        stackView = UIStackView(arrangedSubviews: [firstNameLabel,
                                                  secondNameLabel,
                                                  ageLabel,
                                                  phoneLabel,
                                                  emailLabel,
                                                  passwordLabel],
                                axis: .vertical,
                                spacing: 10,
                                distribuiton: .fillProportionally)
        view.addSubview(stackView)
    }
    
    private func setModel() {
        guard let activeUser = DataBase.shared.activeUser else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        
        let dateString = dateFormatter.string(from: activeUser.age)
        
        firstNameLabel.text = activeUser.firstName
        secondNameLabel.text = activeUser.secondName
        phoneLabel.text = activeUser.phone
        emailLabel.text = activeUser.email
        passwordLabel.text = activeUser.password
        ageLabel.text = dateString
    }
}


//MARK: - setConstraints
extension UserInfoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
}
