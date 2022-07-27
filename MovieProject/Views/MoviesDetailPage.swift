//
//  MoviesDetailPage.swift
//  MovieProject
//
//  Created by Theappmedia on 7/27/22.
//

import SwiftUI

struct MoviesDetailPage: View {
    @Environment(\.presentationMode) var cancel
    var body: some View {
        VStack{
            ZStack{
                Image("image")
                    .resizable()
                    .scaledToFill()
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
                    .ignoresSafeArea()
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
                        Text("Fortunately we can")
                            .font(.title2)
                        Button {
                            
                        } label: {
                            Text("Get Tickets")
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width*0.7, height: 70)
                                .background(Color("blue"))
                                .cornerRadius(10)
                        }
                        Button {
                            
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
                    Text("Fortunately we can write one ourselves by leveraging SwiftUI’s view builder system. This means writing a type that must be created using a row and column count, plus a closure it can run to retrieve the views for a given cell in the grid. Inside the body it can then loop over all the rows and columns and create cells inside VStack and HStack to make a grid, each time calling the view closure to ask what should be in the cell.")
                        .foregroundColor(Color("gray"))
                }
            }
            .frame(width:UIScreen.main.bounds.width-50, alignment: .leading)
            Spacer()
        }
    }
}

struct MoviesDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailPage()
.previewInterfaceOrientation(.portrait)
    }
}
