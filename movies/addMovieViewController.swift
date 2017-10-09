//
//  addMovieViewController.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/28/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

protocol createMovieDelegate {
    func createMovie(movie: Movie, vc: UIViewController)
}

class addMovieViewController: UIViewController {
    
    @IBOutlet weak var movieTitleField: UITextField!
    @IBOutlet weak var movieDirectorField: UITextField!
    @IBOutlet weak var movieRatingField: UITextField!
    @IBOutlet weak var moviePlotField: UITextView!
    @IBOutlet weak var movieDateField: UITextField!
    
    var delegate: createMovieDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func newMovieButton(_ sender: Any) {
        if delegate != nil {
            if !(movieTitleField.text?.isEmpty)! && !(movieDirectorField.text?.isEmpty)! && !(movieRatingField.text?.isEmpty)! && (!(moviePlotField.text?.isEmpty)! && moviePlotField.text != "TYPE A PLOT") && !(movieDateField.text?.isEmpty)! {
                let movie: Movie = Movie(title: movieTitleField.text!, director: movieDirectorField.text!, plot:moviePlotField.text!, date: movieDateField.text!, rating: Float(movieRatingField.text!)!, img:"noPic")
                delegate?.createMovie(movie: movie, vc: self)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        movieTitleField.endEditing(true)
        movieDirectorField.endEditing(true)
        movieRatingField.endEditing(true)
        moviePlotField.endEditing(true)
        movieDateField.endEditing(true)
    }
    
}
