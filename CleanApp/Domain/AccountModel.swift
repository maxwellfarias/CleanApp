//
//  AccountModel.swift
//  Domain
//
//  Created by Maxwell Farias on 11/04/24.
//

import Foundation

public struct AccountModel: Model {
    public var accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
