//
//  detallePeliculaViewController.swift
//  Peliculas
//
//  Created by Developer iOS  on 23/08/21.
//

import UIKit
import Kingfisher

class detallePeliculaViewController: UIViewController {
    
    //Globales
    var pelicula: datosPelicula?
    
    //IBOutlets
    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblRanking: UILabel!
    

    @IBAction func clickAtras(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Descripcion: \(pelicula?.vote_average)")
        lblTitulo.text = pelicula?.title
        lblDescripcion.text = pelicula?.overview
        lblRanking.text = pelicula?.vote_average
        getImage(url: pelicula!.poster_path)
    }

    
    func getImage(url: String){
        let urlString = constantes.URLDOWNLOADIMAGE+url
        let url = URL(string: urlString)!
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        
        let processor = DownsamplingImageProcessor(size: imgPelicula.bounds.size)
        imgPelicula.kf.indicatorType = .activity
        
        imgPelicula.kf.setImage(
            with: resource,
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result{
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
    }

}
