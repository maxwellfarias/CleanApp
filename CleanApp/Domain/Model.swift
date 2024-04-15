//
//  Model.swift
//  Domain
//
//  Created by Maxwell Farias on 12/04/24.
//

import Foundation

public protocol Model: Codable, Equatable {}

extension Model {
    public func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

