//
//  WeChatSwiftUIApp.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

//程序入口，类似AppDelegate
@available(iOS 15.0, *)
@main
struct WeChatSwiftUIApp: App {

    //App生命周期关联,属性包装器
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    //等价于
//    private var appDelegate = UIApplicationDelegateAdaptor(AppDelegate.self)
    
    // 监听App的活跃状态， \. 代表系统
    @Environment(\.scenePhase) private var scenePhase: ScenePhase
    
    var body: some Scene {
        
        //window窗口
        WindowGroup {
            //wechat demo
            TabMenu()
                .environmentObject(TabViewState())
            
            //表单demo
//            MyTextField()
//            FormDemo()
            
            //PickerView
//            SwiftUI_Picker()
            
            //Alert
//            SwiftUI_Alert()
            
            // 动画
//            SwiftUI_Animation() // 动画
//            SwiftUI_OffSetAnimation() // 偏移动画
//            SwiftUI_SpringAnimation() // 弹性动画
//            SwiftUI_BoradAnimation() // 水波纹动画
//            SwiftUI_DisplayAndDismiss() //从无到有的动画
            
            //label
//            SwiftUI_Label()
            
            //GridView
//            SwiftUI_GridView()
            //适配
//            SwiftUI_GeometryReaderView()

            //Appstroage
//            SwiftUI_AppStorage()
           
        }
        .onChange(of: scenePhase) { newValue in
            //监听App的状态
            switch newValue {
            case .background:
                print("App进入后台")
                break
                
            case .inactive:
                print("App进入非活跃状态")
                break
                
            case .active:
                print("App进入活跃状态")
                break
                
            @unknown default:
                break
            }
        }
    }
}

/**
    UIKit中 通过AppDelegate管理App的生命周期
    在SwiftUI中，需要借助UIKit，通过属性包装器进行关联
 */

class AppDelegate: NSObject,UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("didFinishLaunchingWithOptions")
        appConfig()
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let configuration = UISceneConfiguration(
                                             name: nil,
                                             sessionRole: connectingSceneSession.role)
         if connectingSceneSession.role == .windowApplication {
             configuration.delegateClass = MySceneDelegate.self
         }
         return configuration
    }
    
    /**
        初始化全局配置
     */
    func appConfig() {
        
        //设置视图滚动时，收起键盘
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        
        //设置Tabbar
        let itemAppearance = UITabBarItemAppearance()
        let appearance = UITabBarAppearance()
        
        //图片颜色
        itemAppearance.normal.iconColor = .orange
        itemAppearance.selected.iconColor = .red
        
        //文本颜色
        itemAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.orange]
        itemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.red]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.configureWithDefaultBackground()
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UITabBar.appearance().standardAppearance = appearance
        }
        
        //全局设置navBar的毛玻璃效果
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = naviBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance
        
    }
}

class MySceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        let contentView = TabMenu()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let tabBar = TabViewState()
            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(tabBar))
            self.window = window
            
            //监听TabBarState
            
//            let pub = tabBar.$taBarHidden.receive(on: DispatchQueue.main).sink { output in
//                print(output)
//            }
            
//            tabBar.$taBarHidden.receive(subscriber: AnySubscriber(receive))
        }
    }
    
    func tabBarHidden(hidden: Bool) {
        
        
    }
    
}




/**
    Preview Content文件夹
    Preview Assets 主要是存放测试图片，在App上线时，不会打包到ipa中
    该文件夹下的资源也不会被打包到ipa中
 */

