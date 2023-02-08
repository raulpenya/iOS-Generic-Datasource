//
//  ExampleDataSource.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 8/2/23.
//

import Foundation
import Combine

struct ExampleDataSource: GenericNetworkingDataSource {
    func getAllPersons() async -> [Person] {
        let request = URLRequest(url: URL(string: "https://10225bfa-a047-4ea0-9ded-715308e698e3.mock.pstmn.io/person/all")!)
        let resource = Resource<PersonsRemoteEntity, [Person]>(request: request) { persons in
            return persons.transformToDomain()
        }
        var persons: [Person] = []
        do {
            persons = try await self.request(with: URLSession.shared, resource: resource)
        } catch {
            print(error)
        }
        return persons
    }
    
    func getAllPersons() -> AnyPublisher<[Person], Error> {
        let request = URLRequest(url: URL(string: "https://10225bfa-a047-4ea0-9ded-715308e698e3.mock.pstmn.io/person/all")!)
        let resource = Resource<PersonsRemoteEntity, [Person]>(request: request) { persons in
            return persons.transformToDomain()
        }
        return self.request(with: URLSession.shared, resource: resource)
    }
}
