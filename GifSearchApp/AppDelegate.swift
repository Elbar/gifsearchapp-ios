//
//  AppDelegate.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//

import Foundation

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup and validate API key configuration from Info.plist
        setupAPIKeyConfiguration()
        
        return true
    }
    
    // MARK: - API Key Configuration
    
    /// Configure and validate API key from Info.plist
    /// This demonstrates the recommended approach for demo/development projects
    private func setupAPIKeyConfiguration() {
        
        // Validate API key configuration
        if APIKeyManager.shared.validateAPIKey() {
            // Log configuration details (without exposing the actual key)
            APIKeyManager.shared.logConfiguration()
        } else {
            print("❌ API Key configuration failed - app may not work correctly")
            print("💡 Tip: Add your Giphy API key to Info.plist with key 'GiphyAPIKey'")
        }
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
