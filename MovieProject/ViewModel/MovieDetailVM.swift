//
//  MovieDetailVM.swift
//  MovieProject
//
//  Created by Theappmedia on 7/27/22.
//

import Foundation

class MovieDetailVM:ObservableObject{
    @Published var movieDetail : MoviesDetailModel = MoviesDetailModel(adult: false, backdropPath: "", belongsToCollection: BelongsToCollection(id: 0, name: "", posterPath: "", backdropPath: ""), budget: 0, genres: [Genre(id: 0, name: "")], homepage: "", id: 0, imdbID: "", originalLanguage: "", originalTitle: "", overview: "", popularity: 0, posterPath: "", productionCompanies: [ProductionCompany(id: 0, logoPath: "", name: "", originCountry: "")], productionCountries: [ProductionCountry(iso3166_1: "", name: "")], releaseDate: "", revenue: 0, runtime: 0, spokenLanguages: [SpokenLanguage(englishName: "", iso639_1: "", name: "")], status: "", tagline: "", title: "", video: false, voteAverage: 0, voteCount: 0)
    
    func getMovieDetail(id: String){
        var url = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=5e4f9c434a8e35fae00ab6c40dd782e3")!,timeoutInterval: Double.infinity)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do{
                    let dt = try JSONDecoder().decode(MoviesDetailModel.self, from: data)
                    DispatchQueue.main.async {
                        self.movieDetail = dt
                    }
                   
                }catch let jsonerror as NSError{
                    print(jsonerror.localizedDescription)
                }
                
            }
            if let error = error {
                print(error)
            }
        }
        .resume()
    }
}
