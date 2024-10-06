//
//  Details.swift
//  ProductsApp
//
//  Created by Gül Karataş on 6.10.2024.
//

import UIKit

class Details: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageViewSelected: UIImageView!
    
    var product: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            navigationItem.title = p.name
            priceLabel.text = "\(p.price!)"
            imageViewSelected.image = UIImage(named: p.image!)
        }
        
    }
    

    @IBAction func selectedAddButton(_ sender: Any) {
        if let p = product {
            print ("\(p.name!) added to cart")
        }
    }
    

}
