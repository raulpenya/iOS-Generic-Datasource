//
//  iOS_Generic_Datasource_ExampleApp.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 6/2/23.
//

import SwiftUI

@main
struct iOS_Generic_Datasource_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
