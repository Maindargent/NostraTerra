//
//  NotificationBanner.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 12/08/2026.
//

import SwiftUI

struct NotificationBanner: View {
    @State var isShowing: Bool = true
    
    let notif: Notification

    var body: some View {
        if isShowing {
            HStack {
                Text(notif.content)
                Image(systemName: notif.type.icon)
                Spacer()
            }
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(notif.type.color)
            .glassEffect(.regular.tint(notif.type.color.opacity(0.1)))
            .border(notif.type.color, width: 2)
            .clipShape(.capsule)
            .padding()
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }
}

#Preview {
    RootView()
}
