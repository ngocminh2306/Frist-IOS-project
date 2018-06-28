//
//  GetDataViewController.swift
//  day-5
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class GetDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var lstRestaurance: [Restaurant] = []
    private func getData() {
        
        let stUrl = "https://api.fpt.io/restaurants"
        
        let url = URL(string: stUrl)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            guard let responseData = data else {
                
                print("no data in response")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let todo = try decoder.decode([Restaurant].self, from: responseData)
                print(todo)
                self.lstRestaurance = todo
                DispatchQueue.main.async {
                    //self..reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
