//
//  SelectSeat.swift
//  MovieProject
//
//  Created by Theappmedia on 7/28/22.
//

import SwiftUI

struct SelectSeat: View {
    let ab = [1,2,3,4,5,6,7,8]
    @Environment(\.presentationMode) var cancel
    @State var gotoPayPage = false
    var body: some View {
        VStack{
            NavigationLink(destination: PayView(),isActive:$gotoPayPage) {
                EmptyView()
            }
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
                    Text("In Theaters Deember 22, 2022")
                        .foregroundColor(Color("blue"))
                }
                .padding(.trailing)
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                HStack{
                    Text("Date")
                    Spacer()
                }
                
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                        ForEach(ab,id:\.self){num in
                            Text("\(num)Mar")
                                .padding(.horizontal,15)
                                .padding(.vertical,7)
                                .background(Color("lightGray"))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .font(.caption)
                        }
                    }
                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        VStack{
                            HStack{
                                Text("12:30")
                                Text("Cintech + Hall 1")
                                    .foregroundColor(Color("gray"))
                            }
                            .frame(width: 200, alignment: .leading)
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray,lineWidth: 1)
                                .frame(width: 200, height: 150)
                                .overlay(Image("seats")
                                            .resizable()
                                            .frame(width: 160, height: 100))
                            HStack{
                                Text("From")
                                    .foregroundColor(Color("gray"))
                                Text("50$")
                                Text("or")
                                    .foregroundColor(Color("gray"))
                                Text("2500 bonus")
                            }
                            .frame(width: 200, alignment: .leading)
                        }
                        VStack{
                            HStack{
                                Text("12:30")
                                Text("Cintech + Hall 1")
                                    .foregroundColor(Color("gray"))
                            }
                            .frame(width: 200, alignment: .leading)
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray,lineWidth: 1)
                                .frame(width: 200, height: 150)
                                .overlay(Image("seats")
                                            .resizable()
                                            .frame(width: 160, height: 100))
                            HStack{
                                Text("From")
                                    .foregroundColor(Color("gray"))
                                Text("50$")
                                Text("or")
                                    .foregroundColor(Color("gray"))
                                Text("2500 bonus")
                            }
                            .frame(width: 200, alignment: .leading)
                        }
                        VStack{
                            HStack{
                                Text("10:30")
                                Text("Cintech + Hall 3")
                                    .foregroundColor(Color("gray"))
                            }
                            .frame(width: 200, alignment: .leading)
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray,lineWidth: 1)
                                .frame(width: 200, height: 150)
                                .overlay(Image("seats")
                                            .resizable()
                                            .frame(width: 160, height: 100))
                            HStack{
                                Text("From")
                                    .foregroundColor(Color("gray"))
                                Text("50$")
                                Text("or")
                                    .foregroundColor(Color("gray"))
                                Text("2500 bonus")
                            }
                            .frame(width: 200, alignment: .leading)
                        }
                        VStack{
                            HStack{
                                Text("11:30")
                                Text("Cintech + Hall 1")
                                    .foregroundColor(Color("gray"))
                            }
                            .frame(width: 200, alignment: .leading)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray,lineWidth: 1)
                                .frame(width: 200, height: 150)
                                .overlay(Image("seats")
                                            .resizable()
                                            .frame(width: 160, height: 100))
                            HStack{
                                Text("From")
                                    .foregroundColor(Color("gray"))
                                Text("90$")
                                Text("or")
                                    .foregroundColor(Color("gray"))
                                Text("2500 bonus")
                            }
                            .frame(width: 200, alignment: .leading)
                        }
                    }
                    .font(.caption)

                }
                Spacer()
                Spacer()
                Button {
                    gotoPayPage.toggle()
                } label: {
                    Text("Select Seats")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width*0.9, height:60)
                        .background(Color("blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom,5)
            }
            .padding(.leading)
            .background(Color("white").ignoresSafeArea())
            
            
        }
        .navigationBarHidden(true)
    }
}

struct BookSeat_Previews: PreviewProvider {
    static var previews: some View {
        SelectSeat()
    }
}
