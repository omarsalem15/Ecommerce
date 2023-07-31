//
//  Cart.swift
//  ODC-Project
//
//  Created by Omar Salem on 30/07/2023.
//

import UIKit

class Cart: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myCartTblView: UITableView!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    var actualCart : [Products]!
    
    var passedQuantity : Int!
    
    var easyCart : Products!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        myCartTblView.register(UINib(nibName: "CartCell", bundle:nil), forCellReuseIdentifier: "cell")

        var cell = myCartTblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartCell

        let cartItemsArray = CartManager.shared.cartItems[indexPath.row]
        
        cell.cartTitle.text = cartItemsArray.product.title
        cell.cartPrice.text = "\(cartItemsArray.product.price) EGP"
        //cell.cartQuantity.text = "\(passedQuantity)"
        cell.cartQuantity.text = "Quantity : \(cartItemsArray.quantity)"
        let imageURL = URL(string: cartItemsArray.product.image)
        cell.cartImg.sd_setImage(with: imageURL)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
     func updateTotalPriceLabel() {
         let cartItems = CartManager.shared.cartItems
        var total = 0
        for cartItem in cartItems {
            total += Int(Double(cartItem.product.price)) * cartItem.quantity
        }
        totalPriceLabel.text = "Total Price: \(total) EGP"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCartTblView.delegate = self
        myCartTblView.dataSource = self
        updateTotalPriceLabel()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Refresh cart data here
            myCartTblView.reloadData()
            updateTotalPriceLabel()
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
