//
//  Session.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 28/2/23.
//

import Foundation
import Combine

protocol Session {
    typealias RequestResponse = URLSession.DataTaskPublisher.Output
    func data(for url: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<RequestResponse, URLError>
}

extension Session {
    func data(for url: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: url, delegate: nil)
    }
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<RequestResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

extension URLSession: Session {}
