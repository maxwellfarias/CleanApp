//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Maxwell Farias on 15/04/24.
//

import Foundation
import Data

class HttpClientSpy: HttpPostClient {
    var urls = [URL]()
    var data: Data?
    var completion: ((Result<Data?, HttpError>) -> Void)?
    
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        self.urls.append(url)
        self.data = data
        self.completion = completion
    }
    
    func completeWithError(_ error: HttpError) {
        completion?(.failure(.noConnectivity))
    }
    
    func completeWithData(_ data: Data) {
        completion?(.success(data))
    }
}
