//
//  DetailsViewController.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePicture: UIImageView!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var movieDate: UILabel!
    
    var titleString = String()
    var pictureName = UIImage()
    var directorString = String()
    var plotString = String()
    var dateString = String()
    
    func configureView() {
        movieTitleLabel.text = titleString
        moviePicture.image = pictureName
        movieDirector.text = directorString
        moviePlot.text = plotString
        movieDate.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
}
