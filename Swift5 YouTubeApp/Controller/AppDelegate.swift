//
//  AppDelegate.swift
//  Swift5 YouTubeApp
//
//  Created by 平林宏淳 on 2020/06/18.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let hours = 19
    let minute = 00
   //プッシュ通知を可能にするかどうかのフラグ
    var notificationGranted = true
    //最初の処理かどうかのフラグ
    var isFirst = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //強化を促すアラートを出す
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
            self.notificationGranted = granted
            
            //if error != nil と同じ意味　errorの中に何かあればこの処理をしてください
            if let error = error {
                print("エラーです。")
            }
        }
        //最初の処理なら実行。最初じゃなければ実行しない
        isFirst = false
        setNotification()

        return true
    }
    
    func setNotification() {
        var notificationTime = DateComponents()
        var trigger: UNNotificationTrigger
        
        notificationTime.hour = hours
        notificationTime.minute = minute
        //notificationTimeの時間に通知を送る処理　いつ送るか
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: true)
        
        //どんな文章を流すか
        let content = UNMutableNotificationContent()
        content.title = "19時になりました。"
        content.body = "ニュースが更新されました。"
        content.sound = .default
        
        //通知スタイル
        let request = UNNotificationRequest(identifier: "uid", content: content, trigger: trigger)
        //通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //アプリが閉じてても通知が行く処理
    func applicationDidEnterBackground(_ application: UIApplication) {
        setNotification()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

