//
//  UIImageCustom.swift
//  day-5
//
//  Created by admin on 6/30/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension UIImageView {
    func getImageFormUrl(url: String) {
        DispatchQueue.global().async {
            let urlLink = URL(string: url)
            
            if urlLink == nil {
                return
            }
            
            let data = try? Data(contentsOf: urlLink!)
            DispatchQueue.main.async {
                if data == nil{
                    return
                }
                self.image = UIImage(data: data!)
            }
        }
    }
    func getImageURL(url: URL) {
        DispatchQueue.global().async {
            
            if url == nil {
                return
            }
            
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if data == nil{
                    return
                }
                self.image = UIImage(data: data!)
            }
        }
    }
}


extension UIViewController{
    func alertMessager(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
