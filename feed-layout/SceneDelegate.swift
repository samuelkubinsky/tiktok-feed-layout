//
//  SceneDelegate.swift
//  feed-layout
//
//  Created by Samuel Kubinský on 10/06/2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = FeedViewController()
        window?.makeKeyAndVisible()
    }
    
}
