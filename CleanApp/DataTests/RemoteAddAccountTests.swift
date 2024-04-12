//
//  DataTests.swift
//  DataTests
//
//  Created by Maxwell Farias on 11/04/24.
//

import XCTest

//Use Case
class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpClient
    
    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    func post(url: URL)
}

class RemoteAddAccountTests: XCTestCase {
    func test_() {
        let url: URL = URL(string: "http://any-url.com")!
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClient)
        sut.add()
        XCTAssertEqual(httpClient.url, url)
    }
    
    class HttpClientSpy: HttpClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url
        }
    }
}
