//
//  RegisterViewController.swift
//  SchoolChat
//
//  Created by ZL on 16/6/17.
//  Copyright © 2016年 WoF. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var chatname: UITextField!
    
    
  
    
    @IBAction func Regi(sender: AnyObject) {
        //1970标准时间戳
        let timeString = "\(NSDate().timeIntervalSince1970*1000)"
        
        //准备更新的信息
        let username = self.ID.text!
        let passward = self.password.text!
        let Name = self.chatname.text!
        let user = "accid=\(username)&token=\(passward)&name=\(Name)"
        
        //标准http请求header
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.netease.im/nimserver/user/create.action")!)
        request.HTTPMethod = "POST"
        request.addValue("0f5a5ed59a0fa44ec27c07edf2b1a2da", forHTTPHeaderField: "AppKey")
        request.addValue("182736458493", forHTTPHeaderField: "nonce")
        request.addValue(timeString, forHTTPHeaderField:"CurTime" )
        request.addValue(calc("c501c23f8d1a",num: "182736458493",cur: timeString), forHTTPHeaderField: "CheckSum" )
        request.addValue("application/x-www-form-urlencoded;charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
        
        
        
        //发送请求
        request.HTTPBody = user.dataUsingEncoding(NSUTF8StringEncoding)
        
        //消息返回
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else
            {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200
            {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            //用户名被使用
            if(responseString!.containsString("already register"))
            {
                let alertController = UIAlertController.init(title: nil, message: "用户名已被使用", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction.init(title: "知道了，我去换一个", style: UIAlertActionStyle.Default, handler: nil))
                dispatch_async(dispatch_get_main_queue(), {self.presentViewController(alertController, animated: true, completion: nil)})
            }
            
            //http返回字符串
            print("responseString = \(responseString!)")
        }
        task.resume()
        
    }
    
    
    @IBOutlet weak var Regbutton: UIButton!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ID: UITextField!
    
 
    

    
    //哈西 sha1加密算法
    func calc (appsecret:String,num:String,cur:String) -> String
    {
        
        let result = appsecret+num+cur
        return result.sha1()
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
