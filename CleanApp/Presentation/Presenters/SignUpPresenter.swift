//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Maxwell Farias on 25/04/24.
//

import Foundation

public class SignUpPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    
    init(alertView: AlertView, emailValidator: EmailValidator) {
        self.alertView = alertView
        self.emailValidator = emailValidator
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo nome é obrigatório"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "O campo email é obrigatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo password é obrigatório"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo password confirmation é obrigatório"
        } else if viewModel.passwordConfirmation != viewModel.password {
            return "O campo password confirmation é inválido"
        } else if !emailValidator.isValid(email: viewModel.email!) {
            return "O campo email é inválido"
        }
        _ = emailValidator.isValid(email: viewModel.email!)
        return nil
    }
}

//It will be in the same file as SignUpPresenter because it is a viewModel used only in the signUp function
public struct SignUpViewModel {
    var name: String?
    var email: String?
    var password: String?
    var passwordConfirmation: String?
    
    init(name: String? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
