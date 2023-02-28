//
//  Session.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 28/2/23.
//

import Foundation

protocol Session {
    func data(for url: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension Session {
    func data(for url: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: url, delegate: nil)
    }
}

extension URLSession: Session {}
