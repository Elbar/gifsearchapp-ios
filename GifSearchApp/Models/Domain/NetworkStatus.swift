//
//  NetworkStatus.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


// MARK: - Network Status
enum NetworkStatus: Equatable {
    case connected
    case disconnected
    case connecting
    
    var description: String {
        switch self {
        case .connected:
            return "Connected"
        case .disconnected:
            return "No Internet Connection"
        case .connecting:
            return "Connecting..."
        }
    }
    
    var isAvailable: Bool {
        return self == .connected
    }
}
