//
//  ViewController.swift
//  ProductsApp
//
//  Created by Gül Karataş on 5.10.2024.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    
    var products = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        productsTableView.dataSource = self
        productsTableView.delegate = self
        
        let urun1 = Products(id: 1, name: "Lenova Laptop", price: 10, image: "bilgisayar")
        let urun2 = Products(id: 2, name: "Gözlük", price: 15, image: "gözlük")
        let urun3 = Products(id: 3, name: "Kulaklık", price: 20, image: "kulaklık")
        let urun4 = Products(id: 4, name: "Parfüm", price:14 , image: "parfüm")
        let urun5 = Products(id: 5, name: "Saat", price: 12, image: "saat")
        let urun6 = Products(id: 6, name: "Telefon", price: 18, image: "telefon")
        
        products.append(urun1)
        products.append(urun2)
        products.append(urun3)
        products.append(urun4)
        products.append(urun5)
        products.append(urun6)
        
        productsTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        
    }


}

extension Home: UITableViewDataSource, UITableViewDelegate , CellProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre", for: indexPath) as! ProductsCell
        cell.imageViewProduct.image = UIImage(named: product.image!)
        cell.labelProductName.text = product.name
        cell.labelProductPrice.text = "\(product.price!) TL"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        
        cell.indexPath = indexPath
        cell.cellProtocol = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = products[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Sil"){_,_,_ in
            print("\(product.name!) silindi")
        }
        let edit = UIContextualAction(style: .normal, title: "Düzenle"){_,_,_ in
            print("\(product.name!) düzenlendi")
            }
            
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let urun = sender as? Products {
               let vc = segue.destination as! Details
                vc.product = urun
            }
        }
    }
    func addCartSelected(indexPath: IndexPath) {
        let product = products[indexPath.row]
        
    }
}
