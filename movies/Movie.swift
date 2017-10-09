//
//  Movie.swift
//  movies
//
//  Created by Alejandro Ferrero on 9/26/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    
    var title:String = ""
    var director:String = ""
    var plot:String = ""
    var date:String = ""
    var rating:Float = 0
    var img = UIImage()
    
    init(title: String, director: String, plot: String, date: String, rating: Float, img: String?) {
        self.title = title
        self.director = director
        self.plot = plot
        self.date = date
        self.rating = rating
        if (img == "") {
            self.img = UIImage(named: "movie.png")!
        } else {
           self.img = UIImage(named: img! + ".jpg")!
        }
    }
}


// MARK: - Same concept but with a class instead of struct

//class Movie {

//private var _title:String = ""
//private var _director:String = ""
//private var _plot:String = ""
//private var _date:String = ""
//private var _rating:String = ""
//private var _img = UIImage()
//
//var title: String {
//    return _title
//}
//var director: String {
//    return _director
//}
//var plot: String {
//    return _plot
//}
//var date: String {
//    return _date
//}
//var rating: String {
//    return _rating
//}
//
//
//init(title: String, director: String, plot: String, date: String, rating: String, img: String?) {
//    _title = title
//    _director = director
//    _plot = plot
//    _date = date
//    _rating = rating
//    //      _img = UIImage(named: "TheLionKing.jpg")!
//}
//}
//
