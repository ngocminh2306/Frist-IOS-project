//
//  ViewController.swift
//  day-5
//
//  Created by admin on 6/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ViewSignUpControlleDelegete {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func touchUpButton(_ sender: Any) {
        
        /*
         chuyển trang homeSegue
         */
        if tfUserName.text!.count == 0 || tfPassword.text!.count == 0 {
            self.showAlert(message: "Bạn chưa nhập tài khoản hoặc mật khẩu")
        }else{
            
        }
        self.performSegue(withIdentifier: "homeSegue", sender: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerSegue"{
            //regiterSucecss(userName: )
            let des = segue.destination as? ViewSignUpController
            des?.delegate = self
        }
    }
    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        //Chạy khi quay lại trang
    }
    override func viewWillAppear(_ animated: Bool) {
        contentView.layer.cornerRadius = 5
        btnSignIn.layer.cornerRadius = 5
        //Chạy khi quay lại trang
    }
    func showAlert(messenger: String, action: UIAlertAction){
        
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //MASK: implement deleget
    func regiterSucecss(userName: String) {
        tfUserName.text! = userName
//        self.showAlert(message: "oh ban da dang ky sdt:\(userName)")
    }
}

