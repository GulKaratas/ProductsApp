//
//  ProductsCell.swift
//  ProductsApp
//
//  Created by Gül Karataş on 5.10.2024.
//

import UIKit

protocol CellProtocol {
    func addCartSelected(indexPath : IndexPath)
}

class ProductsCell: UITableViewCell {
    
   

    @IBOutlet weak var cellBackground: UIView!
    
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonAdd(_ sender: Any) {
        cellProtocol?.addCartSelected(indexPath: indexPath!)
    }
    
}
