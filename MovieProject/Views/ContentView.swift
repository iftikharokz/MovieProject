//
//  ContentView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : ViewModel
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
                        Image("cross")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding()
                .background(Color("white"))
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
                ListView(text: $text, showSearchBar: $showSearchBar, viewModel: viewModel)
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
                        Image("dash")
                            .resizable()
                            .frame(width: 18, height: 18)
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
                        Image("watch")
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
                        Image("lib")
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
                        Image("Vector")
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
        ContentView(viewModel: ViewModel())
    }
}
