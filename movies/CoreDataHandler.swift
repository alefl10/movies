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

    var hasLaunched:[HasLaunched] = [HasLaunched]()
    
    init(){}
    
    func insertMovie(movie: MovieStruct) {
        let cdMovie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: CoreDataController.getContext()) as! Movie
        cdMovie.title = movie.title
        cdMovie.director = movie.director
        cdMovie.plot = movie.plot
        cdMovie.date = movie.date
        cdMovie.rating = movie.rating
        cdMovie.img = movie.img
        CoreDataController.saveContext()
    }
    
    func getMovie (title: String) -> Movie? {
        let movies = fetchMovies()
        for movie in movies {
            if movie.title == title {
                return movie
            }
        }
        return nil
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
    
    func checkFirstLoad() -> Bool {
        let fetchRequest:NSFetchRequest<HasLaunched> = HasLaunched.fetchRequest()
        do {
            let fetchedResults = try CoreDataController.getContext().fetch(fetchRequest)
            if fetchedResults.count == 0 {
                executeFirstLoad()
                return true
            } else {
                return false
            }
        } catch  {
            print("There was an error within \"viewDidAppear\" fetching \"hasLaunched\": \(error)")
            return false
        }
    }
    
    private func executeFirstLoad() {
        clearCD()
        print("executeFirstLoad")
        let hasLaunched = NSEntityDescription.insertNewObject(forEntityName: "HasLaunched", into: CoreDataController.getContext()) as! HasLaunched
        hasLaunched.launched = false
    }
    
    private func clearCD() {
        let fetchRequest:NSFetchRequest<HasLaunched> = HasLaunched.fetchRequest()
        do {
            let fetchedResults = try CoreDataController.getContext().fetch(fetchRequest)
            if fetchedResults.count != 0 {
                for launched in fetchedResults {
                    CoreDataController.getContext().delete(launched)
                }
            }
        } catch  {
            print("There was an error within \"viewDidAppear\" fetching \"hasLaunched\": \(error)")
        }
    }
    
}
