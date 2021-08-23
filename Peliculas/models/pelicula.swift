//
//  pelicula.swift
//  Peliculas
//
//  Created by Developer iOS  on 23/08/21.
//

import Foundation
import UIKit

class datosPelicula: NSObject {
    
    var adult: Int = 0
    var backdrop_path: String = ""
    var genre_ids: [Int] = [Int]()
    var id: Int = 0
    //"media_type" = movie;
    //"original_language" = en;
    var original_title: String = ""
    var overview: String = ""
    var popularity: String  = ""
    var poster_path: String = ""//"/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg";
    var release_date: String = "" //2012-04-25
    var title: String = ""
    var video: Int = 0
    var vote_average: String = ""
    var vote_count: Int = 0;
    var imagen: UIImage = UIImage()
    init(dictionary: [String:Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "adult"{
            if let adulto = value as? Int{
                self.adult = adulto
            }else{
                self.adult = 0
            }
        }else if key == "backdrop_path"{
            if let path_back = value as? String{
                self.backdrop_path = path_back
            }else{
                self.backdrop_path = ""
            }
        }else if key == "poster_path"{
            if let path_poster = value as? String{
                self.poster_path = path_poster
            }else{
                self.poster_path = ""
            }
        }else if key == "title"{
            if let titulo = value as? String{
                self.title = titulo
            }else{
                self.title = ""
            }
        }else if key == "overview"{
            if let over = value as? String {
                self.overview = over
            }else{
                self.overview = ""
            }
        }else if key == "vote_average"{
            if let vote = value as? String{
                self.vote_average = vote
            }else if let voteD = value as? Double{
                self.vote_average = "\(voteD)"
            }
        }
    }
}
