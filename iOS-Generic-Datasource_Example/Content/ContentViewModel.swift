//
//  ContentViewModel.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 7/2/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    var cancellableSet: Set<AnyCancellable> = []
    
    func networkAsyncButtonPressed() {
        Task {
            let datasource = ExampleDataSource()
            do {
                let persons = try await datasource.getAllPersons()
                print(persons)
            } catch {
                print(error)
            }
        }
    }
    
    func networkCombineButtonPressed() {
        let datasource = ExampleDataSource()
        datasource.getAllPersons().sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("networkCombineButtonPressed :: publisher finished")
            }
        } receiveValue: { persons in
            print(persons)
        }.store(in: &cancellableSet)
    }
}
