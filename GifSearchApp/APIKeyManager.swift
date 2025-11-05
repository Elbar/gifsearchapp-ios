//
//  APIKeyManager.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


import Foundation

// MARK: - API Key Manager
class APIKeyManager {
    
    static let shared = APIKeyManager()
    private init() {}
    
    // MARK: - API Key Retrieval
    var giphyAPIKey: String {
        if let plistKey = getAPIKeyFromInfoPlist() {
            return plistKey
        }
        
        // Fallback to demo key with warning
        print("⚠️ WARNING: Using demo API key. Add GiphyAPIKey to Info.plist for production!")
        return ""
    }
    
    // MARK: - Info.plist Configuration
    private func getAPIKeyFromInfoPlist() -> String? {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "GiphyApiKey") as? String,
              !apiKey.isEmpty else {
            print("📝 No GiphyAPIKey found in Info.plist")
            return nil
        }
        
        // Basic validation to ensure it's not a placeholder
        if apiKey.contains("YOUR_API_KEY") || apiKey.contains("REPLACE_ME") {
            print("❌ Please replace placeholder API key in Info.plist")
            return nil
        }
        
        print("✅ API Key loaded from Info.plist")
        return apiKey
    }
    
    
    // MARK: - Validation
        func validateAPIKey() -> Bool {
        let key = giphyAPIKey
        
        guard key.count >= 20 else {
            print("❌ API Key validation failed: Too short")
            return false
        }
        
        let placeholders = ["YOUR_API_KEY", "REPLACE_ME", "API_KEY_HERE", "PLACEHOLDER"]
        for placeholder in placeholders {
            if key.uppercased().contains(placeholder) {
                print("❌ API Key validation failed: Contains placeholder text")
                return false
            }
        }
        
        print("✅ API Key validation passed")
        return true
    }
    
        func logConfiguration() {
        let key = giphyAPIKey
        let isFromPlist = getAPIKeyFromInfoPlist() != nil
        
        print("""
        🔑 API Key Configuration:
        - Source: \(isFromPlist ? "Info.plist" : "Demo fallback")
        - Length: \(key.count) characters
        - Valid: \(validateAPIKey())
        - First 4 chars: \(String(key.prefix(4)))...
        """)
    }
}
