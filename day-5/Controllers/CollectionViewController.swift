//
//  GetDataViewController.swift
//  day-5
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listRestaurant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath) as! CollectionViewCellCustom

            cell.imageContent.getImageFormUrl(url: listRestaurant[indexPath.row].resPhoto)

        return cell
    }
    
    @IBOutlet weak var productColection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productColection.delegate = self
        productColection.dataSource=self
        getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var listRestaurant: [Restaurant] = []
    private func getData() {
        
        let stUrl = "https://api.fpt.io/restaurants"
        
        BackEndManager.getRestaurantListFrom(host: stUrl) { (respones_Restaurant: [Restaurant]) in
            self.listRestaurant = respones_Restaurant
            DispatchQueue.main.async {
                self.productColection.reloadData()
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
