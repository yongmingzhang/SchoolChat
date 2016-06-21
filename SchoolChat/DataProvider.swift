//
//  DataProvider.swift
//  SchoolChat
//
//  Created by ZL on 16/6/19.
//  Copyright © 2016年 WoF. All rights reserved.
//

import Foundation

class DataProvider : NSObject, NIMKitDataProvider {
    func infoByUser(userId: String, withMessage message: NIMMessage) -> NIMKitInfo {
        let info: NIMKitInfo = NIMKitInfo()
        info.avatarImage = UIImage(named: "avatar_user")
        let user: NIMUser = NIMSDK.sharedSDK().userManager.userInfo(userId)!
        if (user.userInfo?.nickName == nil)
        {info.showName = userId}
        else
        {info.showName = user.userInfo?.nickName}
        return info
    }
    
    func infoByUser(userId: String, inSession session: NIMSession) -> NIMKitInfo {
        let info: NIMKitInfo = NIMKitInfo()
        info.avatarImage = UIImage(named: "avatar_user")
        let user: NIMUser = NIMSDK.sharedSDK().userManager.userInfo(userId)!
        if (user.userInfo?.nickName == nil)
        {info.showName = userId}
        else
        {info.showName = user.userInfo?.nickName}
        return info
    }
}
