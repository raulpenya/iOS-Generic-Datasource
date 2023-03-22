//
//  MockGenericNetworkingDataSource.swift
//  iOS-Generic-Datasource-Tests
//
//  Created by raulbot on 24/2/23.
//

import Foundation
@testable import iOS_Generic_Datasource_Example

enum DataSourceResponse {
    case success
    case error
}

class MockGenericNetworkingDataSource: GenericNetworkingDataSource { }
