//
//  ContentView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var text:String = ""
    @State var showSearchBar : Bool = false
    var body: some View {
        VStack{
            if showSearchBar{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("TV show , movies and more", text: $text)
                    Button {
                        showSearchBar.toggle()
                    } label: {
                        Image(systemName: "arrow.uturn.forward")
                    }
                }
                .padding()
                .background(Color("lightGray"))
                .cornerRadius(20)
                .padding()
            }else{
                HStack{
                    Text("Watch")
                    Spacer()
                    
                    Button {
                        showSearchBar.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("black"))
                    }
                }
                .padding()
            }
            switch viewModel.buttonPressed{
            case .Dashboard:
                Text("Dashboard View")
            case .Watch:
                ListView(text: $text, showSearchBar: $showSearchBar)
            case .Media:
                Text("Media View")
            case .More:
                Text("More View")
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    viewModel.buttonPressed = .Dashboard
                } label: {
                    VStack(spacing: 8){
                        Image(systemName: "person")
                        Text("Dashboard")
                            .font(.caption)
                    }
                }
                .foregroundColor(viewModel.buttonPressed == .Dashboard ? Color("white"):Color("gray"))
                Spacer()
                Button {
                    viewModel.buttonPressed = .Watch
                } label: {
                    VStack(spacing: 8){
                        Image(systemName: "person")
                        Text("Watch")
                            .font(.caption)
                    }
                }
                .foregroundColor(viewModel.buttonPressed == .Watch ? Color("white"):Color("gray"))
                Spacer()
                Button {
                    viewModel.buttonPressed = .Media
                } label: {
                    VStack(spacing: 8){
                        Image(systemName: "person")
                        Text("Media Library")
                            .font(.caption)
                    }
                }
                .foregroundColor(viewModel.buttonPressed == .Media ? Color("white"):Color("gray"))
                Spacer()
                Button {
                    viewModel.buttonPressed = .More
                } label: {
                    VStack(spacing: 8){
                        Image(systemName: "person")
                        Text("More")
                            .font(.caption)
                    }
                }
                .foregroundColor(viewModel.buttonPressed == .More ? Color("white"):Color("gray"))
                Spacer()
            }
            .foregroundColor(Color("white"))
            .padding()
            .padding(.vertical,4)
            .background(Color("black"))
            .cornerRadius(22)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
