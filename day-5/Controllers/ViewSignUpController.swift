//
//  ViewSignUpController.swift
//  day-5
//
//  Created by admin on 6/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol ViewSignUpControlleDelegete {
    func regiterSucecss(userName: String)
}

class ViewSignUpController: UIViewController {
    var delegate: ViewSignUpControlleDelegete? = nil
    @IBOutlet weak var emailOrPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoConfirmEmailOrPhone"{
            //regiterSucecss(userName: )
//            let des = segue.destination as? ViewSignUpController
//            des?.delegate = self
            let prevView = segue.destination as? ConfirmViewController
            prevView?.phoneOrEmail = emailOrPhone.text
        }
    }
    @IBAction func touchUpInSide(_ sender: Any) {
    UserData.shareInstance.username = self.emailOrPhone.text!
    self.delegate?.regiterSucecss(userName:self.emailOrPhone.text!)
        if self.emailOrPhone.text!.count == 0{
            self.showAlert(message: "Bạn chưa nhập email/số điện thoại!")
            return;
        }else{
            if self.emailOrPhone.text!.count < 6{
                self.showAlert(message: "email/số điện thoại tối thiểu 6 ký tự!")
                return;
            }else{
                self.delegate?.regiterSucecss(userName: self.emailOrPhone.text!)
                
         //self.navigationController?.popViewController(animated: true)
                
                self.performSegue(withIdentifier: "gotoConfirmEmailOrPhone", sender: nil)
   }
        }
    }
    func showAlert(message: String){
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
