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
    var img:String = ""
    
    init(title: String, director: String, plot: String, date: String, rating: Float, img: String) {
        self.title = title
        self.director = director
        self.plot = plot
        self.date = date
        self.rating = rating
        switch img {
        case "TheLionKing":
            self.img = img + ".jpg"
        case "TheSocialNetwork":
            self.img = img + ".jpg"
        case "GoodWillHunting":
            self.img = img + ".jpg"
        default:
            self.img = "movie.png"
        }
        
    }
}
