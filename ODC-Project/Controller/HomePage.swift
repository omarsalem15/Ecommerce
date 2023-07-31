//
//  ViewController.swift
//  ODC-Project
//
//  Created by Omar Salem on 22/07/2023.
//

import UIKit
import SDWebImage

class HomePage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch selectedCategory {
                case "men's clothing":
                    return mensCateg.count
                case "women's clothing":
                    return womenCateg.count
                case "jewelery":
                    return jeweleryCateg.count
                case "electronics":
                    return electronicsCateg.count
                default:
            return globalProductsArray.count
                }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        productCollection.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellWithReuseIdentifier: "categoriesCell")
        var cell = productCollection.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCell

        var selectedProducts: [Products]
                switch selectedCategory {
                case "men's clothing":
                    selectedProducts = mensCateg
                case "women's clothing":
                    selectedProducts = womenCateg
                case "jewelery":
                    selectedProducts = jeweleryCateg
                case "electronics":
                    selectedProducts = electronicsCateg
                case "all":
                    selectedProducts = globalProductsArray
                default:
                    selectedProducts = globalProductsArray
                }

                let product = selectedProducts[indexPath.row]
                cell.productTitle.text = product.title
                cell.productPrice.text = "\(product.price) EGP"
                let imageURL = URL(string: product.image)
                cell.productImage.sd_setImage(with: imageURL)

                return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                switch selectedCategory {
                case "men's clothing":
                    selectedProducts = mensCateg
                case "women's clothing":
                    selectedProducts = womenCateg
                case "jewelery":
                    selectedProducts = jeweleryCateg
                case "electronics":
                    selectedProducts = electronicsCateg
                case "all":
                    selectedProducts = globalProductsArray
                default:
                    selectedProducts = globalProductsArray
                }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        
        if let productDetailVC = storyboard.instantiateViewController(withIdentifier: "productDetailsID") as? ProductDetails {
            navigateTo(productDetailVC)
            productDetailVC.easy = selectedProducts[indexPath.row]
            
            }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.4, height: self.view.frame.width*0.8)
    }
    
    
    
    var globalProductsArray : [Products] = []
    
    var selectedProducts: [Products] = []
    
    var selectedCategory : String!
    
    var mensCateg : [Products] = []
    var womenCateg : [Products] = []
    var jeweleryCateg : [Products] = []
    var electronicsCateg : [Products] = []
    
    
    

    
    @IBOutlet weak var productCollection: UICollectionView!

    var network = NetworkManager()

    override func viewDidLoad() {

        
        productCollection.delegate = self
        productCollection.dataSource = self
        
        
        network.getData { prod in

            
            if let pr = prod.self{
                self.globalProductsArray = pr

            }
            
            for product in self.globalProductsArray {
                switch product.category {
                case "men's clothing":
                    self.mensCateg.append(product)
                case "women's clothing":
                    self.womenCateg.append(product)
                case "jewelery":
                    self.jeweleryCateg.append(product)
                case "electronics":
                    self.electronicsCateg.append(product)
                default:
                    print("default")
                }
                }

            DispatchQueue.main.async {
                self.productCollection.reloadData()
            }
            
            
            //print("global after closure \(self.globalProductsArray)")
            print("global after closure \(self.globalProductsArray.count)")
        }

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        
    }
    
    
    @IBAction func menBtn(_ sender: Any) {
        selectedCategory = "men's clothing"
        productCollection.reloadData()
       
    }
    @IBAction func allBtn(_ sender: Any) {
        selectedCategory = "all"
        productCollection.reloadData()
    }
    @IBAction func womenBtn(_ sender: Any) {
        selectedCategory = "women's clothing"
        productCollection.reloadData()
    }
    @IBAction func jeweleryBtn(_ sender: Any) {
        selectedCategory = "jewelery"
        productCollection.reloadData()
    }
    @IBAction func electronicsBtn(_ sender: Any) {
        selectedCategory = "electronics"
        productCollection.reloadData()
    }

    @IBOutlet weak var allButton: UIButton!
}

