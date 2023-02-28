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
        let session = MockUrlSession()
        let resource = MockResource.getResource()
        //When
        Task {
            do {
                let persons = try await dataSource.request(with: session, resource: resource)
                print(persons)
            } catch {
                print(error)
            }
        }
        //Then
        
    }
}

class MockUrlSession: Session {
    
    enum response {
        case success
        case error
    }
    
    func data(for url: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        print("MockUrlSession")
        return (Data(), URLResponse())
    }
}

struct MockResource {
    static func getResource() -> Resource<PersonsRemoteEntity, [Person]> {
        let request = URLRequest(url: URL(string: ExampleDataSource.personsArray)!)
        return Resource<PersonsRemoteEntity, [Person]>(request: request) { persons in
            return persons.transformToDomain()
        }
    }
}
