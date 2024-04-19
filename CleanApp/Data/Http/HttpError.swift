//
//  HttpError.swift
//  Data
//
//  Created by Maxwell Farias on 12/04/24.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
