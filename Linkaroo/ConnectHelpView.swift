//
//  ConnectHelpView.swift
//  Linkaroo
//
//  Created by Zahyaan Azmi on 4/5/2026.
//


import SwiftUI

struct ConnectHelpView: View {
    @State private var message = ""

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Text("Need personalised help?")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Connect with a verified volunteer for step-by-step guidance. For legal, visa, health or government matters, volunteers should provide general guidance and direct users to official services where required.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                TextEditor(text: $message)
                    .frame(height: 160)
                    .padding(8)
                    .background(Color.cardBackground)
                    .cornerRadius(14)

                Button {
                    message = ""
                } label: {
                    Text("Request help")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Connect")
    }
}