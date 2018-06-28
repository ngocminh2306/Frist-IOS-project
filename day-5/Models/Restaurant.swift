//
//  Restaurant.swift
//  day-5
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

struct Restaurant : Decodable {
//    resId: 1,
//    resPhoto: "https://paris.peninsula.com/en/~/media/Images/Paris/NEW/dining/loiseau-blanc/ppr-oiseau-blanc-interior-evening-1074.ashx?mw=952",
//    resName: "French Grill",
//    resDesciption: "Số 1 trên 322 Cà phê & Trà ở Hà Nội"
    var resId: Int
    var resPhoto: String
    var resName: String
    var resDesciption: String
}
