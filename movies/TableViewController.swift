//
//  TableViewController.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class TableViewController: UITableViewController, createMovieDelegate {
    
    var detailsViewController: DetailViewController? = nil
    var movies = [Movie]()
    let cdHandler = CoreDataHandler()
    let bHandler = BundleDataHandler()
    //    let movieDB = DataBase()
    
    override func viewDidLoad() {
        if cdHandler.checkFirstLoad(){
            cdHandler.executeFirstLoad()
            let bundleMovies = bHandler.getBundleMovie()
            for movie in bundleMovies {
                cdHandler.insertMovie(movie: movie)
            }
            movies = cdHandler.fetchMovies()
            print("First Load")
        } else {
           movies = cdHandler.fetchMovies()
            print("CORE DATA")
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    // MARK: - createMovie Protocol
    
    func createMovie(movie: MovieStruct, vc: UIViewController) {
            cdHandler.insertMovie(movie: movie)
            movies = cdHandler.fetchMovies()
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.navigationController?.popViewController(animated: true)
            vc.dismiss(animated: true, completion: nil)
        //        tableView.reloadData()
    }
    
    
    // MARK: - Segues
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let nextVC = segue.destination as! DetailViewController
                nextVC.titleString = movies[indexPath.row].title!
                nextVC.pictureName = UIImage(named: movies[indexPath.row].img!)!
                nextVC.directorString = movies[indexPath.row].director!
                nextVC.plotString = movies[indexPath.row].plot!
                nextVC.dateString = movies[indexPath.row].date!
            }
        } else if segue.identifier == "addMovie" {
            let addMovieVC : addMovieViewController = segue.destination as! addMovieViewController
            addMovieVC.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.init(red: 159.0/255.0, green: 33.0/255.0, blue: 31.0/255.0, alpha: 1.0)
    }
    
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellViewController
        let movie = movies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieRating.text = String(movie.rating)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataController.getContext().delete(movies[indexPath.row])
            movies.remove(at: indexPath.row)
            CoreDataController.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
