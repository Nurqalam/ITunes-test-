//
//  String + extension.swift
//  ITunesProjectTest
//
//  Created by Nurqalam on 18.05.2022.
//

import Foundation

extension String {
    
    enum ValidTypes {
        case name
        case email
        case password
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
        case email = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[A0-9]).{6,}"
    }
    
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = "[a-zA-Z]{1,}"

        switch validType {
            
        case .name:
            regEx = Regex.name.rawValue
        case .email:
            regEx = Regex.email.rawValue
        case .password:
            regEx = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
}
