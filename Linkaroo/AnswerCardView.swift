//
//  AnswerCardView.swift
//  Linkaroo
//
//  Created by Zahyaan Azmi on 4/5/2026.
//


import SwiftUI

struct AnswerCardView: View {
    let answer: Answer

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            if answer.isVerified {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Verified answer — moderator approved")
                        .fontWeight(.semibold)
                }
                .font(.caption)
                .foregroundColor(.white)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.green)
                .cornerRadius(12)
            } else {
                HStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)

                    Text("Community answer — not yet reviewed")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
            }

            HStack {
                Circle()
                    .fill(answer.isVerified ? Color.green.opacity(0.25) : Color.orange.opacity(0.25))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Text(answer.author.prefix(2))
                            .fontWeight(.bold)
                    )

                VStack(alignment: .leading) {
                    Text(answer.author)
                        .fontWeight(.bold)

                    Text(answer.role)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                if answer.isVerified {
                    BadgeView(text: "Top helper", color: .purple)
                }
            }

            if answer.isVerified {
                HStack {
                    BadgeView(text: "Senior match · 98%", color: .blue)
                    BadgeView(text: "Mod approved", color: .green)
                }
            }

            Text(answer.text)
                .font(.body)
                .lineSpacing(4)

            if let source = answer.source {
                BadgeView(text: "Source: \(source)", color: answer.isVerified ? .blue : .red)
            }

            HStack {
                Label("\(answer.helpfulCount)", systemImage: "arrowtriangle.up.fill")

                Spacer()

                if answer.isVerified {
                    Text("✓ \(answer.helpfulCount) found helpful")
                        .foregroundColor(.green)
                }

                Text(answer.isVerified ? "Reply" : "Flag")
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(answer.isVerified ? Color.green : Color.clear, lineWidth: 1.5)
        )
        .cornerRadius(18)
    }
}