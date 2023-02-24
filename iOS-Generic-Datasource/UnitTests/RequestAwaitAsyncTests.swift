//
//  RequestAwaitAsyncTests.swift
//  iOS-Generic-Datasource-Tests
//
//  Created by raulbot on 24/2/23.
//

import XCTest
@testable import iOS_Generic_Datasource_Example

final class RequestAwaitAsyncTests: XCTestCase {

    func test_request_success() {
        //Given
        let dataSource = MockGenericNetworkingDataSource()
        let session = MockUrlSession.shared
        let resource = MockResource.getSuccessRequest()
        //When
        dataSource.request(with: session, resource: resource)
        //Then
        
    }

}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}

class MockUrlSession: URLSession {
    
}

struct MockResource {
    static func getSuccessRequest() -> Resource<PersonsRemoteEntity, [Person]> {
        let request = URLRequest(url: URL(string: ExampleDataSource.personsArray)!)
        return Resource<PersonsRemoteEntity, [Person]>(request: request) { persons in
            return persons.transformToDomain()
        }
    }
}
