//
//  MovieProjectApp.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

@main
struct MovieProjectApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .environmentObject(viewModel)
            }
           
            .navigationViewStyle(.stack)
        }
    }
}
