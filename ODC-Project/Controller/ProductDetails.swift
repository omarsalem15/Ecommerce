//
//  ProductDetails.swift
//  ODC-Project
//
//  Created by Omar Salem on 28/07/2023.
//

import UIKit
import SDWebImage

class ProductDetails: UIViewController {
    
    
    
    var easy : Products!
    
    
    var addedToCart : [Products] = []
    
    
    @IBOutlet weak var productDetailedDescription: UILabel!
    @IBOutlet weak var productDetailedImg: UIImageView!
    @IBOutlet weak var productDetailedTitle: UILabel!
    @IBOutlet weak var productDetailedPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailedTitle.text = easy.title
        productDetailedDescription.text = easy.description
        productDetailedPrice.text = "\(easy.price) EGP"
        let imageURL = easy.image
        
        productDetailedImg.sd_setImage(with:URL(string: imageURL))
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCartBtn(_ sender: Any) {
        CartManager.shared.addToCart(easy)
        
                let storyboard = UIStoryboard(name: "Main", bundle:nil)
                if let cartVC = storyboard.instantiateViewController(withIdentifier: "Cart") as? Cart{
                    navigateTo(cartVC)
    }
        }
    }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    

