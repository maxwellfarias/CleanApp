//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Maxwell Farias on 15/04/24.
//

import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", name: "any_name", email: "any_email", password: "any_password")
}
