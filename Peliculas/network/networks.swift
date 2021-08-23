//
//  networks.swift
//  Peliculas
//
//  Created by Developer iOS  on 23/08/21.
//

import Foundation
import Alamofire

class networkPeliculas: NSObject {
    
    static let ApiServiceShared = networkPeliculas()
    
    func getPeliculasRecomendaciones(_ completion: @escaping(Bool,[datosPelicula]?,String) -> ()) {
        
        let headers: HTTPHeaders = ["content-type": "application/json;charset=utf-8",
                       "authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZDM5MmFmNTM5ZmQyYjZiNGYwZjNjNTI1MWQ2NGYwMiIsInN1YiI6IjYxMjE1N2YwMmRjNDRlMDA3ZTUzNzU3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A_5Vy-ZXxGktN0az5QQXxhdmzM4yCFxn-tcVw819U00"]
        let url = "https://api.themoviedb.org/4/list/1?language=espa%C3%B1ol&api_key=dd392af539fd2b6b4f0f3c5251d64f02&page=1"
        AF.request(url, method: .get, headers: headers).responseJSON{ response in
            print("Respuesta: \(response)")
            var peliculas = [datosPelicula]()
            switch response.result {
            case .success(let json):
                print("Json: \(json)")
                let resultsArray = json as! NSDictionary
                //print("Result: \(resultsArray)")
                let resultDic = resultsArray["results"] as! [[String:Any]]
                //print("Data : \(resultDic)")
                for res in resultDic{
                    let pelicula = datosPelicula(dictionary: res)
                    peliculas.append(pelicula)
                }
                print("Numero de peliculas: \(peliculas.count)")
                if peliculas.count > 0{
                    completion(true,peliculas,"Peliculas obtenidas")
                }else{
                    completion(false,peliculas,"No se encontraron las peliculas")
                }
            case .failure(let error):
                print("Error: \(error)")
                completion(false,peliculas,"Fallo server")
            }
        }
        
    }
    
    func getFavorites() {
        let headers: HTTPHeaders = ["authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZDM5MmFmNTM5ZmQyYjZiNGYwZjNjNTI1MWQ2NGYwMiIsInN1YiI6IjYxMjE1N2YwMmRjNDRlMDA3ZTUzNzU3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A_5Vy-ZXxGktN0az5QQXxhdmzM4yCFxn-tcVw819U00"]
        let url = "https://api.themoviedb.org/4/account/%7Baccount_id%7D/movie/favorites?page=1"
        
        AF.request(url, method: .get, encoding: URLEncoding(destination: .queryString), headers: headers).responseString{ response in
            print("Respuesta favoritos: \(response)")
            switch response.result  {
            case .success(let json):
                print("Json: \(json)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
