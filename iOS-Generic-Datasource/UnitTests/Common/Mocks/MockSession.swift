//
//  MockSession.swift
//  Data
//
//  Created by raulbot on 5/3/23.
//

import Foundation
import Combine
@testable import iOS_Generic_Datasource_Example

class MockSession: Session {
    
    enum Response {
        case success
        case error
        case errorHandleResponse
        case errorDecode
    }
    
    var response: Response = .success
    
    func data(for url: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        throw DataSourceErrors.instanceException
    }
    
    func executeTaskPublisher(for request: URLRequest) -> AnyPublisher<RequestResponse, URLError> {
        switch response {
        case .success:
            return Result.Publisher((String.getSuccessResponse().data(using: .utf8)!, URLResponse.getURLResponseSuccess())).eraseToAnyPublisher()
        case .error:
            return Fail(error: URLError(.timedOut)).eraseToAnyPublisher()
        case .errorHandleResponse:
            return Result.Publisher((String.getSuccessResponse().data(using: .utf8)!, URLResponse.getNoHTTPURLResponseError())).eraseToAnyPublisher()
        case .errorDecode:
            return Result.Publisher((String.getEmptyResponse().data(using: .utf8)!, URLResponse.getURLResponseSuccess())).eraseToAnyPublisher()
        }
    }
}
