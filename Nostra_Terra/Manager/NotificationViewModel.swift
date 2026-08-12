//
//  NotificationViewModel.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 12/08/2026.
//
import SwiftUI

enum NotificationType {
    case success
    case error
    
    var color: Color {
        switch self {
            case .success:
                .greenIndian
            case .error:
                Color.red
        }
    }
    
    var icon: String {
        switch self {
            case .success:
                "checkmark"
            case .error:
                "multiply"
        }
    }
}

struct Notification {
    var id = UUID()
    var content: String
    var type: NotificationType
    var created_at: Date
}

@Observable
final class NotificationViewModel {
    var currentNotif: Notification? = Notification(content: "coucou la notif", type: .success, created_at: .now)
    
    func addNotification(_ content: String, type: NotificationType = .success) {
        let notif = Notification(content: content, type: type, created_at: .now)
        currentNotif = notif
    }
    
    func getNotification() -> Notification? {
        return currentNotif
    }
    
    func notifcationPass(_ notif: Notification) {
        currentNotif = nil
    }
}
