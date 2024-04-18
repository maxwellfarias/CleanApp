//
//  TestFactories.swift
//  DataTests
//
//  Created by Maxwell Farias on 15/04/24.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}
