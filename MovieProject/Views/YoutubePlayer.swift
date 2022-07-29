//
//  YoutubePlayerView.swift
//  MovieProject
//
//  Created by Theappmedia on 7/28/22.
//

import SwiftUI
import YouTubePlayerKit

struct YoutubePlayerView: View {
    @Environment(\.presentationMode) var cancel
    @StateObject var viewModel:ViewModel
    let config = YouTubePlayer.Configuration(autoPlay: true,showControls: true)

    var body: some View {
        VStack{
            YouTubePlayerView(YouTubePlayer(source: .url("https://www.youtube.com/watch?v=\(viewModel.videoKey)"), configuration: config))
        }
        .navigationBarItems(leading: Button(action: {
            cancel.wrappedValue.dismiss()
            viewModel.videoKey = ""
        }, label: {
            Image("back")
                .renderingMode(.template)
                .foregroundColor(.black)
        }))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct YoutubePlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubePlayerView(viewModel: ViewModel())
    }
}
