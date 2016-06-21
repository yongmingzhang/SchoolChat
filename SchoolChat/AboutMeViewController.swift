//
//  AboutMeViewController.swift
//  SchoolChat
//
//  Created by ZL on 16/6/16.
//  Copyright © 2016年 WoF. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController{
    //退出按钮
    
    @IBAction func signout(sender: AnyObject) {
        
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
    
    
    //@IBOutlet weak var MyTabView: UITableView!
    
    func initInfoCell (image: UIImage, ID:String, name:String)-> UITableViewCell
    {
        
        
        let infocell = UITableViewCell.init()
        let imageview = UIImageView.init(image: image)
        infocell.addSubview(imageview)
        
        return infocell
    }
    

 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = NIMSDK.sharedSDK().userManager.userInfo(NIMSDK.sharedSDK().loginManager.currentAccount())
        let avatar = UIImage(named: "avatar_user")
        let accid = currentUser?.userId
        var showName = ""
        if(currentUser?.userInfo?.nickName == nil)
        { showName = accid!}
        else
        { showName = (currentUser?.userInfo?.nickName)!}
        
        initInfoCell(avatar!, ID: accid!, name: showName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
