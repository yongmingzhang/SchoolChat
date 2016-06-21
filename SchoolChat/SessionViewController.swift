//
//  SessionViewController.swift
//  SchoolChat
//
//  Created by ZL on 16/6/17.
//  Copyright © 2016年 WoF. All rights reserved.
//

import UIKit
import MobileCoreServices

class SessionViewController:  NIMSessionViewController
    ,UIImagePickerControllerDelegate,
    UINavigationControllerDelegate,
    NIMSystemNotificationManagerDelegate,
    NIMMediaManagerDelgate
{
  
    
    //多媒体选项功能
    override func onTapMediaItem(item: NIMMediaItem!) {
        
        switch item.tag {
        case 1:                                                                                 //照片
            let imagepicker = UIImagePickerController.init()
            imagepicker.delegate = self
            imagepicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagepicker.mediaTypes = [kUTTypeImage as String]
            self.presentViewController(imagepicker, animated: true, completion: {})
        
            

        default:
            print("无对应多媒体")
        }
       
    }
    
    
    //相册选择器：获得并发送照片
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let oriImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageMessage = NIMMessage()
        imageMessage.messageObject = NIMImageObject.init(image: oriImage)
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.sendMessage(imageMessage)
    }
    
    //会话设置文件
    override func sessionConfig() -> NIMSessionConfig! {
        return MySessionConfig()
    }

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sessionConfig()
        // Do any additional setup after loading the view.
    }


    //会话隐藏tab
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

        
    

}
