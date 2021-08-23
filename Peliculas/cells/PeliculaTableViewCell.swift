//
//  PeliculaTableViewCell.swift
//  Peliculas
//
//  Created by Developer iOS  on 23/08/21.
//

import UIKit
import Kingfisher

class PeliculaTableViewCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getImage(url: String){
        let urlString = constantes.URLDOWNLOADIMAGE+url
        print("URL comopleta: \(urlString)")
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
