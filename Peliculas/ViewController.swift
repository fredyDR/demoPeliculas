//
//  ViewController.swift
//  Peliculas
//
//  Created by Developer iOS  on 23/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var peliculasArray = [datosPelicula]()
    var cell = "PeliculaTableViewCell"
    //IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpTable()
    }
    
    overrride func viewWillAppear(){
        networkPeliculas.ApiServiceShared.getPeliculasRecomendaciones{ (status, peliculas, mensaje) in
            if status{
                for pelicula in peliculas!{
                    print("Nombre de pelicula: \(pelicula.poster_path)\n")
                    self.peliculasArray.append(pelicula)
                }
                print("\(self.peliculasArray.count)")
                self.tableView.reloadData()
            }else{
                print("Error: \(mensaje)")
            }
        }
    }
    
    func setUpTable() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peliculasArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! PeliculaTableViewCell
        
        cell.getImage(url: peliculasArray[indexPath.row].backdrop_path)
        cell.lblTitulo.text = peliculasArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detallePeliculaViewController()
        vc.pelicula = peliculasArray[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

