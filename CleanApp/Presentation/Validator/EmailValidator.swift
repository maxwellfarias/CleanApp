//
//  EmailValidator.swift
//  Presentation
//
//  Created by Maxwell Farias on 25/04/24.
//

import Foundation

protocol EmailValidator {
    func isValid(email: String) -> Bool
}
