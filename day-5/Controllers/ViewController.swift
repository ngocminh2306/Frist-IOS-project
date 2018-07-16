//
//  ViewController.swift
//  day-5
//
//  Created by admin on 6/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class ViewController: UIViewController, ViewSignUpControlleDelegete, GIDSignInUIDelegate {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnLoginGoogle: GIDSignInButton!
    @IBOutlet weak var btnFacebookLogin: UIButton!
    @IBOutlet weak var avatar: UIImageView!
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
        //avatar.alpha = 0
        //        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.repeat, .autoreverse, .curveEaseIn], animations: {
        //            //self.avatar.alpha = 1.0
        //
        //        }, completion: nil)
        //SHAKE hieu ung lo xo
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.center = self.view.center
        fbLoginButton.readPermissions = ["public_profile", "email"]
        self.view.addSubview(fbLoginButton)
        FBSDKProfile.enableUpdates(onAccessTokenChange: true)
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
    
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
        if FBSDKAccessToken.currentAccessTokenIsActive() {
            FBSDKProfile.loadCurrentProfile(completion: {
                (profile,error)in profile
                var urlImage = profile!.imageURL(for: FBSDKProfilePictureMode.normal, size: CGSize.init())
                self.avatar.getImageURL(url: urlImage!)
                
                self.alertMessager(title: "login FB", message: "hello \(profile!.firstName!) \(profile!.lastName!)")
            })
        }
    }
    
    @IBAction func btnGoToLoginFB(_ sender: Any) {
        let fbManage = FBSDKLoginManager()
        fbManage.logIn(withReadPermissions: [], from: self) { (result, error) in
            
            if result != nil {
                
            } else if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
//        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnClickLoginGoogle(_ sender: Any) {

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

