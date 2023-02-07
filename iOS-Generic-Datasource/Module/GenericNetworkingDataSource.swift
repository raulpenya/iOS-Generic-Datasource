//
//  GenericNetworkingDataSource.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 6/2/23.
//

import Foundation
import Combine

struct Resource<T: Decodable, Q> {
    let request: URLRequest
    let transform: (T) -> Q
}

protocol GenericNetworkingDataSource {
    func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) async throws -> Q
    func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) -> AnyPublisher<Q, Error>
}

extension GenericNetworkingDataSource {
    func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) async throws -> Q {
        let (data, _) = try await session.data(for: resource.request)
        let decoder = JSONDecoder()
        let entity = try decoder.decode(T.self, from: data)
        return resource.transform(entity)
    }
    
//    func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) -> AnyPublisher<Q, Error> {
//        let task = session.dataTask(with: resource.request)
//        let task = session.dataTaskPublisher(for: <#T##URL#>)
//        task.
//    }
}
