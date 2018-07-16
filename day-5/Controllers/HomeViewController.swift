//
//  TestViewController.swift
//  day-5
//
//  Created by admin on 6/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

    import UIKit
    
    class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, OptionButtonsDelegate {
        var refresh = UIRefreshControl();
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listRestaurant.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //        let cell = tbViewRestaurant.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.lblTitile?.text  = listRestaurant[indexPath.row].resName
            cell.lblSubTitile?.text  = listRestaurant[indexPath.row].resDesciption
            cell.delegate = self
            cell.indexPath = indexPath
            cell.btnAccept?.setTitle("Accept", for: UIControlState.normal)
            cell.btnAccept.addTarget(self, action: #selector(self.btnAccept(sender:)), for: UIControlEvents.touchUpInside)
            // cell.btnDelete?.image =
            //cell.detailTextLabel?.text = listImage
            let url = URL(string: listRestaurant[indexPath.row].resPhoto)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if data != nil{
                        cell.titleImage?.image = UIImage(data: data!)
                    }

                }
            }

            cell.btnAccept.tag = indexPath.row
            return cell
        }
        
        @objc func btnAccept (sender: UIButton){
            alertMessager(title: "\(sender.tag)", message: "2")
        }
        
        func closeFriendsTapped(at index: IndexPath) {
            alertMessager(title: "\(index)", message: "button tapped at index:\(index)")
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Section: \(section)"
        }
//        func numberOfSections(in tableView: UITableView) -> Int {
//            //Tra ve so sesstion
//            return 0
//        }
        
        var listRestaurant: [Restaurant] = []
        
        @IBOutlet weak var tbViewRestaurant: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            getData()
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
        //    @IBAction func btnAccept(_ sender: Any) {
        //        self.showAlert(message: "click")
        //    }

        private func getData() {
            
            let stUrl = "https://api.fpt.io/restaurants"
            
            BackEndManager.getRestaurantListFrom(host: stUrl) { (respones_Restaurant: [Restaurant]) in
                self.listRestaurant = respones_Restaurant
                DispatchQueue.main.async {
                    self.tbViewRestaurant.reloadData()
                }
            }
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

