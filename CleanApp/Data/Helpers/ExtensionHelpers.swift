//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Maxwell Farias on 13/04/24.
//

import Foundation

public extension Data {
    func toModel<T:Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
