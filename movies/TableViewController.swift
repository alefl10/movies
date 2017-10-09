//
//  TableViewController.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController, createMovieDelegate {

    var detailsViewController: DetailsViewController? = nil
    let movieDB = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    // MARK: - createMovie Protocol
    
    func createMovie(movie: Movie, vc: UIViewController) {
        movieDB.addMovie(movie: movie)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        self.navigationController?.popViewController(animated: true)
        vc.dismiss(animated: true, completion: nil)

    }
    
    
    // MARK: - Segues
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let nextVC = segue.destination as! DetailsViewController
                nextVC.titleString = movieDB.getMovies()[indexPath.row].title
                nextVC.pictureName = movieDB.getMovies()[indexPath.row].img
                nextVC.directorString = movieDB.getMovies()[indexPath.row].director
                nextVC.plotString = movieDB.getMovies()[indexPath.row].plot
                nextVC.dateString = movieDB.getMovies()[indexPath.row].date
            }
        } else if segue.identifier == "addMovie" {
            print("addMovie")
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
        return movieDB.getMovies().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellViewController
        for movie in movieDB.getMovies() {
            print(movie.title)
        }
        let movie = movieDB.getMovies()[indexPath.row]
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
            movieDB.removeMovie(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
