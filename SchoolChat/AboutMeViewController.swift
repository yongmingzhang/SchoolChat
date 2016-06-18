//
//  AboutMeViewController.swift
//  SchoolChat
//
//  Created by ZL on 16/6/16.
//  Copyright © 2016年 WoF. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController{

    @IBAction func Logout(sender: AnyObject) {
        
        //清空用户账户信息
        let CurrentAccount = NSUserDefaults.standardUserDefaults()
        CurrentAccount.setObject("", forKey: "account")
        CurrentAccount.setObject("", forKey: "pass")
        
        //返回登陆界面
        let LoginSB = UIStoryboard.init(name: "Login", bundle: nil)
        let LoginVC = LoginSB.instantiateViewControllerWithIdentifier("log") as! LoginViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = LoginVC
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
