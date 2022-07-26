//
//  ViewModel.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    init(){
        fetchMoviesData()
    }
    @Published var buttonPressed : ButtonPressed = .Watch
    @Published var moviesModel : MoviesDataModel = MoviesDataModel(dates: Dates(maximum: "", minimum: ""), page: 0, results: [Result(adult: false, backdropPath: "", genreIDS: [0], id: 0, originalLanguage: OriginalLanguage(rawValue: "en") ?? OriginalLanguage.ja, originalTitle: "", overview: "", popularity: 0, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 0, voteCount: 0)], totalPages: 0, totalResults: 0)
    @Published var image: [UIImage] = []
        
        func loadImage(for urlString: String) {
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.sync {
                    self.image.append(UIImage(data: data) ?? UIImage())
                }
            }
            task.resume()
        }
    
    func fetchMoviesData(){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/upcoming?&api_key=5e4f9c434a8e35fae00ab6c40dd782e3")!,timeoutInterval: Double.infinity)
    //    request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do{
                let dataa = try? JSONDecoder().decode(MoviesDataModel.self, from: data)
                for url in dataa?.results ?? []{
                    DispatchQueue.main.sync {
                        self.loadImage(for: "https://image.tmdb.org/t/p/original"+url.posterPath)
                    }
                }
//
                DispatchQueue.main.async {
                    self.moviesModel = dataa!
                    print(dataa?.results)
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

enum ButtonPressed{
    case Dashboard,Watch,Media,More
}
