//
//  ContentView.swift
//  Linkaroo
//
//  Created by Zahyaan Azmi on 4/5/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                CommunityFeedView()
            }
            .tabItem {
                Label("Feed", systemImage: "list.bullet")
            }

            NavigationStack {
                AskQuestionView()
            }
            .tabItem {
                Label("Ask", systemImage: "plus.circle")
            }

            NavigationStack {
                VolunteerProfileView()
            }
            .tabItem {
                Label("Volunteer", systemImage: "checkmark.seal")
            }

            NavigationStack {
                ConnectHelpView()
            }
            .tabItem {
                Label("Help", systemImage: "person.2")
            }
        }
    }
}
