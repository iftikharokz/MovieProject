//
//  PayView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/29/22.
//

import SwiftUI

struct PayView: View {
    @Environment(\.presentationMode) var cancel
    var body: some View {
        VStack{
            HStack{
                Button {
                    cancel.wrappedValue.dismiss()
                } label: {
                    Image("back")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .padding(.leading)
                }
                Spacer()
                VStack{
                    Text("The Kings Man")
                        .font(.title2)
                    Text("March 5, 2021  12:30 Hall 1")
                        .foregroundColor(Color("blue"))
                }
                .padding(.trailing)
                Spacer()
            }
            Spacer()
            VStack{
                
                HStack{
                    Spacer()
                }
              Spacer()
                HStack{
                    Spacer()
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .overlay(Text("+"))
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .overlay(Text("-"))
                }
               
                Divider()
                    .frame(width: UIScreen.main.bounds.width-50, height: 5, alignment: .center)
                    .background(Color("gray"))
                    .padding(.bottom)
                VStack{
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "person")
                                Text("Selected")
                                    .padding(.vertical)
                            }
                            HStack{
                                Image(systemName: "person")
                                Text("VIP(150$")
                            }
                        }
                        Spacer()
                        VStack{
                            HStack{
                                Image(systemName: "person")
                                Text("Not Available")
                                    .padding(.vertical)
                            }
                            HStack{
                                Image(systemName: "person")
                                Text("Regular(50$")
                            }
                        }
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack{
                        Text("4/3 row")
                            .frame(width: UIScreen.main.bounds.width*0.32, height: 30)
                            .background(Color("lightGray"))
                            .cornerRadius(12)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack{
                        VStack(spacing:0){
                            Text("Total Price")
                                .font(.caption)
                            Text("$ 50")
                                .fontWeight(.bold)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.32, height: 43)
                        .background(Color("lightGray"))
                        .cornerRadius(12)
                        Button {
                            
                        } label: {
                            Text("Total Price")
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width*0.58, height: 43)
                                .background(Color("blue"))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .background(Color.white)
            }
            .background(Color("white").ignoresSafeArea())
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
