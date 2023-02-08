//
//  ContentView.swift
//  iOS-Generic-Datasource_Example
//
//  Created by raulbot on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Button("network async") {
                viewModel.networkAsyncButtonPressed()
            }
            Button("network combine") {
                viewModel.networkCombineButtonPressed()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
