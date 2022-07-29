//
//  ListView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

struct ListView: View {
    @State var gotoDetailPage: Bool = false
    @Binding var text : String
    @Binding var showSearchBar : Bool
    @StateObject var viewModel : ViewModel
    @State var overview = ""
    let columns = [
        GridItem(.flexible())
    ]
    let columns1 = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            NavigationLink(destination: MoviesDetailPage(viewModel: viewModel, overview: overview),isActive: $gotoDetailPage) {
                EmptyView()
            }
            if !text.isEmpty{
                VStack(spacing:3){
                    HStack{
                        Text("Top Results")
                            .fontWeight(.medium)
                            .padding([.top,.leading])
                            .font(.caption)
                            .onTapGesture {
                                
                            }
                        Spacer()
                    }
                    Divider()
                        .frame(width: UIScreen.main.bounds.width*0.9, height: 1, alignment: .center)
                        .background(Color("lightGray"))
                        .padding(.bottom)
                }
               
            }
            ScrollView{
                if text.isEmpty{
                    LazyVGrid(columns: showSearchBar ? columns1:columns , alignment: .center, spacing: 10){
                        ForEach(viewModel.moviesModel.results,id: \.id){items in
                            Button {
                               viewModel.getMovieDetail(id: String(items.id))
                                gotoDetailPage.toggle()
                                overview = items.overview
                            } label: {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/"+items.posterPath) ){image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width:showSearchBar ? (UIScreen.main.bounds.width-30)/2:UIScreen.main.bounds.width-30, height: showSearchBar ? 200/2:200, alignment: .center)
                                .cornerRadius(15)
                                .overlay(Text(items.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(width:showSearchBar ? (UIScreen.main.bounds.width-50)/2:UIScreen.main.bounds.width-50, height:showSearchBar ? 170/2:170, alignment: .bottomLeading))
                                
                            }
                        }
                    }

                }else{
                    ForEach(viewModel.moviesModel.results.filter({$0.title.lowercased().contains(text.lowercased())}),id: \.id){items in
                        HStack{
                            Button {
                               viewModel.getMovieDetail(id: String(items.id))
                                gotoDetailPage.toggle()
                                overview = items.overview
                            } label: {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/"+items.posterPath) ){image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width:UIScreen.main.bounds.width*0.38, height: 100, alignment: .center)
                                .cornerRadius(15)
                           }
                            Text(items.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width:UIScreen.main.bounds.width*0.33, height:100, alignment: .center)
                            Spacer()
                            Button{
                                
                            }label:{
                                Image("dots")
                                        .resizable()
                                        .frame(width: 20, height: 4.5)
                            }
                        }
                        .padding()
                        
                    }
                }
                Spacer()
            }
        }
        .background(Color("white").ignoresSafeArea())
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(text: .constant(""), showSearchBar: .constant(false), viewModel: ViewModel())
//    }
//}
