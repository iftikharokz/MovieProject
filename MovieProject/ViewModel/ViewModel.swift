//
//  ViewModel.swift
//  MovieProject
//
//  Created by Theappmedia on 7/26/22.
//
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    init(){
        fetchMoviesData()
    }
    @Published var buttonPressed : ButtonPressed = .Watch
    @Published var moviesModel : MoviesDataModel = MoviesDataModel(dates: Dates(maximum: "", minimum: ""), page: 0, results: [Result(adult: false, backdropPath: "", genreIDS: [0], id: 0, originalLanguage: OriginalLanguage(rawValue: "en") ?? OriginalLanguage.ja, originalTitle: "", overview: "", popularity: 0, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 0, voteCount: 0)], totalPages: 0, totalResults: 0)
    @Published var movieDetail : MoviesDetailModel = MoviesDetailModel(adult: false, backdropPath: "", belongsToCollection: BelongsToCollection(id: 0, name: "", posterPath: "", backdropPath: ""), budget: 0, genres: [Genre(id: 0, name: "")], homepage: "", id: 0, imdbID: "", originalLanguage: "", originalTitle: "", overview: "", popularity: 0, posterPath: "", productionCompanies: [ProductionCompany(id: 0, logoPath: "", name: "", originCountry: "")], productionCountries: [ProductionCountry(iso3166_1: "", name: "")], releaseDate: "", revenue: 0, runtime: 0, spokenLanguages: [SpokenLanguage(englishName: "", iso639_1: "", name: "")], status: "", tagline: "", title: "", video: false, voteAverage: 0, voteCount: 0)
    @Published var videoData : VideosModel?
    @Published var videoKey : String = ""
    func fetchMoviesData(){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/upcoming?&api_key=5e4f9c434a8e35fae00ab6c40dd782e3")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do{
                let dataa = try? JSONDecoder().decode(MoviesDataModel.self, from: data)
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
    func getMovieDetail(id: String){
        var url = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=5e4f9c434a8e35fae00ab6c40dd782e3")!,timeoutInterval: Double.infinity)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
                do{
                    let dt = try JSONDecoder().decode(MoviesDetailModel.self, from: data)
                    DispatchQueue.main.async {
                        self.movieDetail = dt
                        print(dt)
                    }
                   
                }catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
            }
            if let error = error {
                print(error)
            }
        }
        .resume()
    }
    func getVideoKey(id:String){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=5e4f9c434a8e35fae00ab6c40dd782e3")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                print(String(data: data, encoding: .utf8)!)
                print(" sbdefgvdb")
                 do{
                     let dataa:VideosModel = try JSONDecoder().decode(VideosModel.self, from: data)
                     for key in dataa.results{
                         if key.key != "" && key.type == "Trailer"{
                             DispatchQueue.main.async {
                                 self.videoKey = key.key
                             print(">>>>....................",key.key)
                             }
                         }
                     }
                     print(dataa)
                     print(" 42343252465654645")
                     DispatchQueue.main.async {
                         self.videoData = dataa
                     }
                 }catch DecodingError.dataCorrupted(let context) {
                     print(context)
                 } catch DecodingError.keyNotFound(let key, let context) {
                     print("Key '\(key)' not found:", context.debugDescription)
                     print("codingPath:", context.codingPath)
                 } catch DecodingError.valueNotFound(let value, let context) {
                     print("Value '\(value)' not found:", context.debugDescription)
                     print("codingPath:", context.codingPath)
                 } catch DecodingError.typeMismatch(let type, let context) {
                     print("Type '\(type)' mismatch:", context.debugDescription)
                     print("codingPath:", context.codingPath)
                 } catch {
                     print("error: ", error)
                 }
             }
        }
        task.resume()
    }

}

enum ButtonPressed{
    case Dashboard,Watch,Media,More
}


