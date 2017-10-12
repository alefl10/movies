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
        let url = findDirFile()
        let filerUrl = url.appendingPathComponent("userMovies.json")
        do {
            let data = try Data(contentsOf: filerUrl)
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
            print("File does not exist or could not be serilized as JSON")
            accessBundleMovie()
        }
    }
    
    func addMovie(movie: Movie) {
        db.insert(movie, at: 0)
        writeToJsonFile()
    }
    
    func removeMovie(index: Int){
        db.remove(at: index)
        writeToJsonFile()
    }
    
    func getMovies() -> [Movie] {
        return db
    }
    
    private func createMovie(movieInfo:[String:Any]) -> Movie {
        let movie = Movie(title: movieInfo["title"] as! String, director: movieInfo["director"] as! String, plot: movieInfo["plot"] as! String, date: movieInfo["date"] as! String, rating: movieInfo["rating"] as! Float, img: movieInfo["img"] as! String)
        return movie
    }
    
    private func writeToJsonFile() {
        var movies = [Any]()
        for movie in db {
            var movieDict = [String:Any]()
            movieDict["title"] = movie.title
            movieDict["director"] = movie.director
            movieDict["plot"] = movie.plot
            movieDict["date"] = movie.date
            movieDict["rating"] = NSNumber(value: movie.rating)
            movieDict["img"] = movie.title.replacingOccurrences(of: " ", with: "")
            movies.append(movieDict)
        }
        do {
            let jsonMovie = try JSONSerialization.data(withJSONObject: movies, options: .prettyPrinted)
            let url = findDirFile()
            let jsonURL = url.appendingPathComponent("userMovies.json")
            print(jsonURL)
            try jsonMovie.write(to: jsonURL)
        } catch {
            print(error)
        }
    }
    
    private func findDirFile() -> URL {
        let fileManager = FileManager.default
        let url = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        print(url)
        return url
        
    }
    
    private func accessBundleMovie() {
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

}

