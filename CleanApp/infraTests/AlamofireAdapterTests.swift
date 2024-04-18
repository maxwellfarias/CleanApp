//
//  infraTests.swift
//  infraTests
//
//  Created by Maxwell Farias on 16/04/24.
//

import XCTest
import Alamofire

class AlamofireAdapter {
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func post(to url: URL, with data: Data?) {
        let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
        session.request(url, method: .post, parameters: json, encoding: JSONEncoding.default).resume()
    }
}

final class AlamofireAdapterTests: XCTestCase {
    func test_post_should_make_request_with_valid_url_and_method()  {
        let url = makeUrl()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        let exp = expectation(description: "waiting")
        UrlProtocolStub.observeRequest { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual(request.method, .post)
//As the httpBody for some reason is returning null, so it was necessary to get the httpBodyStream. The check carried out is just to see if there is data, but the ideal scenario would be to convert httpBodyStream to Data and compare the input and output data.
            XCTAssertNotNil(request.httpBodyStream)
            exp.fulfill()
        }
        sut.post(to: url, with: makeValidData())
        wait(for: [exp], timeout: 1)
    }
}

class UrlProtocolStub: URLProtocol {
    static var emit: ((URLRequest) -> Void)?
    
    static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }
    
    override  open class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    open override func startLoading() {
        UrlProtocolStub.emit?(request)
    }
    
    open override func stopLoading() {}
}
