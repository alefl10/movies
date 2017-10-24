//
//  MovieStruct.swift
//  movies
//
//  Created by Alejandro Ferrero on 10/24/17.
//  Copyright © 2017 Alejandro Ferrero. All rights reserved.
//

import Foundation
import UIKit

struct MovieStruct {
    
    var title:String = ""
    var director:String = ""
    var plot:String = ""
    var date:String = ""
    var rating:Float = 0
    var img = UIImage()
    
    init(title: String, director: String, plot: String, date: String, rating: Float, img: String) {
        self.title = title
        self.director = director
        self.plot = plot
        self.date = date
        self.rating = rating
        self.img = UIImage(named: "movie.jpg")!
//        switch img {
//        case "TheLionKing":
//            self.img = UIImage(named: img + ".jpg")!
//        case "TheSocialNetwork":
//            self.img = UIImage(named: img + ".jpg")!
//        case "GoodWillHunting":
//            self.img = UIImage(named: img + ".jpg")!
//        default:
//            self.img = UIImage(named: "movie.jpg")!
//        }
        
    }
}
