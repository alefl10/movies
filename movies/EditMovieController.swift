//
//  EditMovieController.swift
//  movies
//
//  Created by Alejandro Ferrero on 10/25/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

protocol editMovieDelegate {
    func editMovie(movie: Movie, vc: UIViewController)
}

class EditMovieController: UIViewController {
    
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var directorTxtField: UITextField!
    @IBOutlet weak var plotTxtField: UITextView!
    
    @IBOutlet weak var dateTxtField: UITextField!
    
    var movie:Movie = Movie()
    
    var delegate: editMovieDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(EditMovieController.doneBtnTapped(_:)))
    }
    
    func configureView() {
        titleTxtField.text = movie.title
        if movie.img == "movie.png" {
            imgView.image = UIImage(named: movie.img!)!
        } else {
            print(movie.img!)
            imgView.image = UIImage(named: movie.img!)!
        }
        directorTxtField.text = movie.director
        plotTxtField.text = movie.plot
        dateTxtField.text = movie.date
    }
    
    @objc func doneBtnTapped(_ sender : UIBarButtonItem) {
        movie.title = titleTxtField.text!
        movie.director = directorTxtField.text!
        movie.plot = plotTxtField.text!
        movie.date = dateTxtField.text!
        delegate?.editMovie(movie: movie, vc: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTxtField.endEditing(true)
        directorTxtField.endEditing(true)
        plotTxtField.endEditing(true)
        dateTxtField.endEditing(true)
    }
    
}
