//
//  WeChatHomeViewApp.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/20.
//

import SwiftUI

@main
struct WeChatHomeViewApp: App {
    
    //属性包装器propertyWrapper
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    //底层差不多是这样的:
    //private var appDelegate = UIApplicationDelegateAdaptor(AppDelegate.self)
    
    //State
    //@State var x = 1
    //底层差不多是这样的:
    //var x = State(initialValue: 1)
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            Home()
        }.onChange(of: scenePhase) { newScenePhase in
            //SwiftUI文档不全,参考UIKit文档https://developer.apple.com/documentation/uikit/uiscenedelegate
            //UISceneDelegate
            
            switch newScenePhase {
            
            case .background:
                //App进入后台后走这里(字面意义,就是看不见App了,包括上推关闭App)
                //建议操作:释放资源,保存数据,暂停计时器等
                print("App进入后台了")
            
            case .inactive:
                //App变成非活跃状态后走这里
                //包含:1.App遇到了一些中断,比如用户下拉打开控制中心,向上推切换App时,等等,2.回到后台
                //建议操作:暂停正在进行的任务,暂停计时器等
                print("App变成非活跃状态")
            
            case .active:
                //App变成活跃状态/被激活后走这里
                //包含:1.App在前台时,用户取消中断,比如用户下拉打开控制中心又关掉(新版来电话不会打断),2.进入前台,3.首次启动,4.点击推送后打开此App
                //建议操作:刷新视图,开启计时器等
                print("App变成活跃状态")
                
            @unknown default:
                print("其余在未来系统追加的生命周期")
            }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        config()
        
        return true
    }
    
    private func config() {
        //目前还需要用UIKit的知识来解决上下两个bar有时候是透明色的情况
        
        let naviBarAppearance = UINavigationBarAppearance()
        //默认的毛玻璃效果
        naviBarAppearance.configureWithDefaultBackground()
        //要全局设某个bar的属性的话需使用他们的单例
        UINavigationBar.appearance().standardAppearance = naviBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        //设每个tabItem的样式,比如未被选中及被选中后的颜色,字体等等
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.selected.iconColor = UIColor(named: "WeChatGreen")
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "WeChatGreen")!,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11, weight: .medium)
        ]
        //指定在iPhone上时(icon和文本堆叠排列)的tabItem样式
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
