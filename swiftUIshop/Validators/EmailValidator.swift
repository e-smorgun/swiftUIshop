//
//  Validators.swift
//  swiftUIshop
//
//  Created by Evgeny on 21.03.23.
//

import Foundation

// MARK: - Email Validator
class EmailValidator {
    func validate(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
