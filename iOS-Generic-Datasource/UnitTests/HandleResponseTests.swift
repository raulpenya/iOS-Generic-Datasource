//
//  GenericNetworkingDataSourceTests.swift
//  iOS-Generic-Datasource-Tests
//
//  Created by raulbot on 24/2/23.
//

import XCTest
@testable import iOS_Generic_Datasource_Example

final class HandleResponseTests: XCTestCase {
    func test_handleResponse_success() {
        //Given
        let dataSource = MockGenericNetworkingDataSource()
        let data = String.getSuccessResponse().data(using: .utf8)
        let urlResponse = URLResponse.getURLResponseSuccess()
        var errorResponse: Error?
        var dataResponse: Data?
        //When
        do {
            dataResponse = try dataSource.handleResponse(data: data!, response: urlResponse)
        } catch {
            errorResponse = error
        }
        //Then
        XCTAssertNotNil(dataResponse)
        XCTAssertNil(errorResponse)
        XCTAssertEqual(String(decoding: dataResponse!, as: UTF8.self), String.getSuccessResponse())
    }
}

extension URLResponse {
    static func getURLResponseSuccess() -> URLResponse {
        return HTTPURLResponse(url: URL(string: ExampleDataSource.personsArray)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    }
    
    static func getURLResponseError() -> URLResponse {
        return HTTPURLResponse(url: URL(string: ExampleDataSource.personsError)!, statusCode: 404, httpVersion: nil, headerFields: nil)!
    }
}

extension String {
    static func getSuccessResponse() -> String {
        return "{\"persons\":[{\"name\":\"Shyam\",\"email\":\"shyamjaiswal@gmail.com\"},{\"name\":\"Bob\",\"email\":\"bob32@gmail.com\"},{\"name\":\"Jai\",\"email\":\"jai87@gmail.com\"}]}"
    }
    
    static func getErrorResponse() -> String {
        return "404 Bad request"
    }
}
