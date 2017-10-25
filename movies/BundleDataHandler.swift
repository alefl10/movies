//
//  BundleDataHandler.swift
//  movies
//
//  Created by Alejandro Ferrero on 10/24/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation

class BundleDataHandler {
    var db = [MovieStruct]()
    
    
    init(){}
    
    public func getBundleMovie() -> [MovieStruct]{
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
        print("BUNDLE")
        return db
    }
   
    private func createMovie(movieInfo:[String:Any]) -> MovieStruct {
        let movie = MovieStruct(title: movieInfo["title"] as! String, director: movieInfo["director"] as! String, plot: movieInfo["plot"] as! String, date: movieInfo["date"] as! String, rating: movieInfo["rating"] as! Float, img: movieInfo["img"] as! String)
        return movie
    }
    
}
