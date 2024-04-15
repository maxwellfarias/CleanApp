//
//  AddAccount.swift
//  Domain
//
//  Created by Maxwell Farias on 11/04/24.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void)
}

//Quando uma struct eh public, por padrao o seu init eh interno, por isso eh preciso fazer a modificacao para public. Foi necessario deixar tudo publico para que a camada de testes que esta em outro pacote tambem pudesse fazer uso desses protolos e structs
public struct AddAccountModel: Model {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfirmation: String
    
    public init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}




