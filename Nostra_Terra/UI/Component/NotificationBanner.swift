//
//  NotificationBanner.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 12/08/2026.
//

import SwiftUI

struct NotificationBanner: View {
    @Environment(NotificationViewModel.self) var notifVM
    @State var isShowing: Bool = true
    
    let notif: Notification

    var body: some View {
        @Bindable var notifVM = notifVM
        if isShowing {
            HStack {
                Text(notif.content)
                    .lineLimit(2)
                    .font(.callout)
                Spacer()
                Image(systemName: notif.type.icon)
            }
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(notif.type.color)
            .glassEffect(.regular.tint(notif.type.color.opacity(0.1)))
//            .border(notif.type.color, width: 2)
            .clipShape(.capsule)
            .overlay(content: {
                Capsule().stroke(notif.type.color, lineWidth: 1)
            })
            .padding()
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        notifVM.notifcationPass(notif)
                        isShowing = false
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationBanner(notif: Notification(content: "coucou cou zefjzef  zejjjjzef LIanbafu", type: .success, created_at: .now))
        .environment(NotificationViewModel())
}
