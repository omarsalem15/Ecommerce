//
//  NetworkManager.swift
//  ODC-Project
//
//  Created by Omar Salem on 22/07/2023.
//

import Foundation

class NetworkManager {
    
    let apiURL = "https://fakestoreapi.com/products" // project API's URL
    
    var globalProductsArray : [Products] = []
    
    func getData(completion : @escaping (_ prod : [Products]?) -> Void){
        
        let request = URLRequest(url: URL(string:apiURL)!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response,error) in
            
            if let safeData = data {
                
                guard let safeParsedData = self.ParseJSON(safeData) else {return}
                
                //print(safeParsedData)
                
                self.globalProductsArray = safeParsedData
                
                
                
                //print(safeParsedData)
                
                completion(self.globalProductsArray)
            }
            
        }
        
        task.resume()
        
        
        
    }
    
  

        func ParseJSON(_ apiData : Data) -> [Products]?{
            let decoder = JSONDecoder()
            
            print("before do")
            
            do {
                let decodedData = try decoder.decode([Products].self, from: apiData)
                
                //print("/////////////////ParseJSON Function\(decodedData[0].description)")
                
                return decodedData
            }
            catch{
               // print(error)
                return nil
            }
         
        }
        
    
}

