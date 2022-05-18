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
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
    }
    
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = "[a-zA-Z]{1,}"

        switch validType {
        case .name: regEx = Regex.name.rawValue
        }
        
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
}
