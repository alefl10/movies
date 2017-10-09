//
//  DataBase.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation

class DataBase {
    
    var db = [Movie]()
    
    init() {
        let path = Bundle.main.path(forResource: "movieData", ofType: "json")
        print(path ?? "Path was not found!")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(jsonData)
            let dbArr: [Any] = jsonData as! [Any]
            for movie in dbArr {
                let movieDict = movie as! [String:Any]
                let newMovie = createMovie(movieInfo: movieDict)
                db.append(newMovie)
            }
        } catch {
            print(error)
        }
    }
    
    func addMovie(movie: Movie) {
        //Inser Movie in .json as well
        db.insert(movie, at: 0)
    }
    
    func removeMovie(index: Int){
        //Remove Movie from .json as well
        db.remove(at: index)
    }
    
    func getMovies() -> [Movie] {
        return db
    }
    
    private func createMovie(movieInfo:[String:Any]) -> Movie {
        let movie = Movie(title: movieInfo["title"] as! String, director: movieInfo["director"] as! String, plot: movieInfo["plot"] as! String, date: movieInfo["date"] as! String, rating: movieInfo["rating"] as! Float, img: movieInfo["img"] as? String)
        return movie
    }
    
    
    

}

