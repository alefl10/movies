//
//  CoreDataHandler.swift
//  movies
//
//  Created by Alejandro Ferrero on 10/24/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHandler {
    //Making sure init() is not called on accident and creates a new instance of this class
    init(){}
    
    func insertMovie(movie: MovieStruct) -> Bool {
        let cdMovie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: CoreDataController.getContext()) as! Movie
        cdMovie.title = movie.title
        cdMovie.director = movie.director
        cdMovie.plot = movie.plot
        cdMovie.date = movie.date
        cdMovie.rating = movie.rating
        cdMovie.img = movie.img.accessibilityIdentifier
        CoreDataController.saveContext()
        return true
    }
    
    func fetchMovies() -> [Movie] {
        var fectchedMovies = [Movie]()
        let fetchRequest:NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            let fetchedResults = try CoreDataController.getContext().fetch(fetchRequest)
            if fetchedResults.count != 0 {
                for movie in fetchedResults {
                    fectchedMovies.insert(movie, at: 0)
                }
            }
            return fectchedMovies
        } catch  {
            print("There was an error within \"viewDidAppear\": \(error)")
            return fectchedMovies
        }
    }
    
}
