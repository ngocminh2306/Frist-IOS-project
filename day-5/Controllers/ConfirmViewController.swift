//
//  ConfirmViewController.swift
//  day-5
//
//  Created by admin on 6/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    //Su dung closure
    var passDataToConfirmView: (() ->String)? = nil
    var phoneOrEmail: String?
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var tfComfirmCode: UITextField!
    @IBOutlet weak var lblEmailPhone: UILabel!
    @IBOutlet weak var tfNewPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        lblEmailPhone.text = phoneOrEmail
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    @IBAction func btnConfirmTouchUp(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
