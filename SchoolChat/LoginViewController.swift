//
//  LoginViewController.swift
//  SchoolChat
//
//  Created by ZL on 16/6/16.
//  Copyright © 2016年 WoF. All rights reserved.
//

import UIKit
import CryptoSwift
import Foundation

class LoginViewController: UIViewController{
        
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var psw: UITextField!
    @IBOutlet weak var id: UITextField!
    
    //登陆成功后返回 MainTab 界面
    @IBAction func loging(sender: UIButton) {
        
        
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appdelegate.connect(self.id.text!, password: self.psw.text!)
        {
            //储存自动登录信息
        let AccountInfo = NSUserDefaults.standardUserDefaults()
            AccountInfo.setObject(self.id.text!, forKey: "account")
            AccountInfo.setObject(self.psw.text!, forKey : "pass")
            
            //转换到MainTab界面
           let MainSB = UIStoryboard.init(name: "Main", bundle: nil)
           let MainVC = MainSB.instantiateViewControllerWithIdentifier("MainTab") as! UITabBarController
            appdelegate.window?.rootViewController = MainVC
        }
    }
     
}
