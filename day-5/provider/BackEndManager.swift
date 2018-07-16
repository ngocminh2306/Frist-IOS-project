//
//  BackEndManager.swift
//  day-5
//
//  Created by admin on 7/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class BackEndManager {
    //get data
    static func getDataFrom(host: String, completion: @escaping (_ response:Data?, _ error: Error?)->()){
        let urlRequest = URL(string: host)
        
        let task = URLSession.shared.dataTask(with: urlRequest!){(data,response,error) in
            completion(data,error)
        }
        task.resume()
    }
    
    //get restaurant
    
    static func getRestaurantListFrom(host:String, completion: @escaping (_ listRestaurant:[Restaurant])->()){
        BackEndManager.getDataFrom(host: host) { (data, error) in
            guard let dataRestaurant = data else{
                return
            }
            if let listRes = try? JSONDecoder().decode([Restaurant].self, from: dataRestaurant){
                completion(listRes)
            }
        }
    }
}

