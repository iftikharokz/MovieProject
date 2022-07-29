//
//  MoviesDetailPage.swift
//  MovieProject
//
//  Created by Theappmedia on 7/27/22.
//

import SwiftUI

struct MoviesDetailPage: View {
    @Environment(\.presentationMode) var cancel
    @StateObject var viewModel : ViewModel
    var overview:String
    @State var watchTrailer:Bool = false
    var body: some View {
        VStack{
        
            ZStack{
                NavigationLink(destination: YoutubePlayerView(viewModel: viewModel),isActive: $watchTrailer) {
                    EmptyView()
                }
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/"+viewModel.movieDetail.posterPath) ){image in
                    image
                        .resizable()
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                }
//                Image("image")
//                    .resizable()
//                    .scaledToFill()
////                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
//                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Button {
                            cancel.wrappedValue.dismiss()
                        } label: {
                            Image("back")
                        }
                        Text("Watch")
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.leading)
                    Spacer()
                    VStack{
                        Text("In Theaters "+viewModel.movieDetail.releaseDate)
                            .font(.title2)
                        NavigationLink{
                            SelectSeat()
                        } label: {
                            Text("Get Tickets")
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width*0.7, height: 70)
                                .background(Color("blue"))
                                .cornerRadius(10)
                        }
                        Button {
                            viewModel.getVideoKey(id: String(viewModel.movieDetail.id))
                            watchTrailer.toggle()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("blue"),lineWidth: 2)
                                    .frame(width: UIScreen.main.bounds.width*0.7, height: 60)
                                HStack{
                                    Image("play")
                                    Text("Watch Trailer")
                                        .fontWeight(.bold)
                                        
                                }
                            }
                        }
                    }
                    .padding(.bottom,50)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.55)
            .foregroundColor(.white)
            VStack{
                HStack{
                    Text("Genre")
                        .font(.title2)
                    Spacer()
                }
                HStack{
                    Button {
                        
                    } label: {
                        Text("Action")
                            .fontWeight(.medium)
                            .frame(width: 70, height: 25, alignment: .center)
                            .background(Color("green"))
                            .cornerRadius(10)
                           
                    }
                    Button {
                        
                    } label: {
                        Text("Thriller")
                            .fontWeight(.medium)
                            .frame(width: 70, height: 25, alignment: .center)
                            .background(Color("pink"))
                            .cornerRadius(10)
                           
                    }
                    Button {
                        
                    } label: {
                        Text("Science")
                            .fontWeight(.medium)
                            .frame(width: 70, height: 25, alignment: .center)
                            .background(Color("bluedark"))
                            .cornerRadius(10)
                           
                    }
                    Button {
                        
                    } label: {
                        Text("Fiction")
                            .fontWeight(.medium)
                            .frame(width: 70, height: 25, alignment: .center)
                            .background(Color("gray85"))
                            .cornerRadius(10)
                           
                    }
                    Spacer()

                }
                .foregroundColor(.white)
                HStack{
                    Text("Overview")
                        .font(.title2)
                    Spacer()
                }
                ScrollView(showsIndicators: false){
                    Text(overview)
                        .foregroundColor(Color("gray"))
                }
            }
            .frame(width:UIScreen.main.bounds.width-50, alignment: .leading)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct MoviesDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailPage(viewModel: ViewModel(), overview: "")
    }
}
