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
    
    let theLionKing:Movie = Movie(title: "The Lion King", director:"Roger Allers, Rob Minkoff", plot:"Lion cub and future king Simba searches for his identity. His eagerness to please others and penchant for testing his boundaries sometimes gets him into trouble.", date:"June 24, 1994", rating: "8.5", img: "TheLionKing")
    
    let theSocialNetwork:Movie = Movie(title: "The Social Network", director:"David Fincher", plot:"Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, but is later sued by two brothers who claimed he stole their idea, and the co-founder who was later squeezed out of the business.", date:"Oct. 1, 2010", rating: "7.7", img: "TheSocialNetwork")
    
    let goodWillHunting:Movie = Movie(title: "Good Will Hunting", director:"Gus Van Sant", plot:"Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.", date:"Jan. 9, 1998", rating: "8.3", img: "GoodWillHunting")
    
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
        let movie = Movie(title: movieInfo["title"] as! String, director: movieInfo["director"] as! String, plot: movieInfo["plot"] as! String, date: movieInfo["date"] as! String, rating: movieInfo["rating"] as! String, img: movieInfo["img"] as? String)
        return movie
    }
    
    
    

}

