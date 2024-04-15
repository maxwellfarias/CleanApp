//
//  HttpPostClient.swift
//  Data
//
//  Created by Maxwell Farias on 12/04/24.
//

import Foundation
import Domain

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void)
}
