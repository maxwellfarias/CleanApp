//
//  UseCasesIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Maxwell Farias on 22/04/24.
//

import XCTest
import Data
import infra
import Domain
//Nesse momento, apenas serão testados os casos de sucesso, pois os testes de falha já está sendo feito pelos testes unitarios. A finalidade aqui é saber se o UseCase consegue conversar de forma correta com a API.
final class UseCasesIntegrationTests: XCTestCase {

    func test_add_account() {
        let alamofireAdapter = AlamofireAdapter()
                let url = URL(string: "http://localhost:5050/api/signup")!
                let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
                let addAccountModel = AddAccountModel(name: "Max Farias", email: "\(UUID().uuidString)@gmail.com", password: "secret", passwordConfirmation: "secret")
                let exp = expectation(description: "waiting")
                sut.add(addAccountModel: addAccountModel) { result in
                    switch result {
                    case .failure: XCTFail("Expect success got \(result) instead")
                    case .success(let account):
                        XCTAssertNotNil(account.accessToken)
                    }
                    exp.fulfill()
                }
//            wait(for: [exp], timeout: 5)
//            let exp2 = expectation(description: "waiting")
//            sut.add(addAccountModel: addAccountModel) { result in
//                switch result {
//                case .failure(let error) where error == .emailInUse:
//                    XCTAssertNotNil(error)
//                default:
//                    XCTFail("Expect emailInUse error got \(result) instead")
//                }
//                exp2.fulfill()
//            }
            wait(for: [exp], timeout: 5)
        }

}
