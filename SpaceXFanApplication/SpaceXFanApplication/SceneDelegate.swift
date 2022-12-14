//
//  SceneDelegate.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
    }

//    
//    // Splash Screen
//func splashScreen() {
//    let launchScreenVC = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
//    let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "splashController")
//    self.window?.rootViewController = rootVC
//    self.window?.makeKeyAndVisible()
//    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
//}
//
//
//@objc func dismissSplashController() {
//   // Onetime Login
//   
//   if UserDefaults.standard.string(forKey: "user") == nil{
//
//       let launchScreenVC = UIStoryboard.init(name: "Main", bundle: nil)
//       let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "Login_ViewController")
//       self.window?.rootViewController = rootVC
//       self.window?.makeKeyAndVisible()
//  
//   }
//   else
//   {
//       let launchScreenVC = UIStoryboard.init(name: "DashBoard", bundle: nil)
//       let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "Dashboard_ViewController")
//       self.window?.rootViewController = rootVC
//       self.window?.makeKeyAndVisible()
//   }
//}
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

