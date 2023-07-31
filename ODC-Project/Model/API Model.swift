//
//  API Model.swift
//  ODC-Project
//
//  Created by Omar Salem on 22/07/2023.
//

import Foundation

struct Products : Decodable {
    let id : Int
    let title : String
    let price : Double
    let description : String
    let category : String
    let image : String
    let rating : rateCount
}

struct rateCount : Decodable{
    let rate : Double
    let count : Int
}


