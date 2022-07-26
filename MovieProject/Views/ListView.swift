//
//  ListView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack{
            ScrollView{
                ForEach(Array(zip(viewModel.moviesModel.results, viewModel.image)) ,id: \.0.id){ items in
                    NavigationLink {
                        
                    } label: {
                        Image(uiImage: items.1)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width-30, height: 200, alignment: .center)
                            .scaledToFit()
                            .cornerRadius(15)
                            .padding(.top)
                            .overlay(Text(items.0.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width-50, height: 170, alignment: .bottomLeading))
                    }
                }
            }
            Spacer()
        }
        .background(Color("white").ignoresSafeArea())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
