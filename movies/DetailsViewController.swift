//
//  DetailsViewController.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

protocol updateTableDelegate {
    func updateTable(movie: Movie, vc: UIViewController)
}

class DetailsViewController: UIViewController, editMovieDelegate {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePicture: UIImageView!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var movieDate: UILabel!
    
    let cdHandler = CoreDataHandler()
    var movie:Movie = Movie()

    var titleString = String()
    var pictureName = UIImage()
    var directorString = String()
    var plotString = String()
    var dateString = String()
    
    var delegate: updateTableDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(DetailsViewController.editBtnTapped(_:)))
    }
    
    func configureView() {
        movieTitleLabel.text = movie.title
        if movie.img == "movie.png" {
            moviePicture.image = UIImage(named: movie.img!)!
        } else {
            moviePicture.image = UIImage(named: movie.img!)!
        }
        movieDirector.text = movie.director
        moviePlot.text = movie.plot
        movieDate.text = movie.date
    }
    
    @objc func editBtnTapped(_ sender : UIBarButtonItem) {

        performSegue(withIdentifier: "editMovieInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editMovieInfo" {
           let editMovieVC : EditMovieController = segue.destination as! EditMovieController
            editMovieVC.movie = movie
            editMovieVC.delegate = self
        }
    }
    
    func editMovie(movie: Movie, vc: UIViewController) {
        movieTitleLabel.text = movie.title
        movieDirector.text = movie.director
        moviePlot.text = movie.plot
        movieDate.text = movie.date
        self.navigationController?.popViewController(animated: true)
        vc.dismiss(animated: true, completion: nil)
        delegate?.updateTable(movie: movie, vc: self)
    }
    
}


