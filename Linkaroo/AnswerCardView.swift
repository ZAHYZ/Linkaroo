import SwiftUI

struct AnswerCardView: View {
    let answer: Answer

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            answerStatus

            authorRow

            Text(answer.text)
                .font(.body)
                .lineSpacing(4)
                .foregroundColor(.primary)

            sourceRow

            footerRow
        }
        .padding()
        .background(Color.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
        .cornerRadius(18)
    }

    private var answerStatus: some View {
        Group {
            if answer.isVerified {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)

                    Text("Verified answer")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    Text("· Reviewed by moderator")
                        .foregroundColor(.secondary)
                }
                .font(.caption)
            } else {
                HStack(spacing: 6) {
                    Image(systemName: "info.circle")
                        .foregroundColor(.orange)

                    Text("Community answer")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    Text("· Not reviewed")
                        .foregroundColor(.secondary)
                }
                .font(.caption)
            }
        }
    }

    private var authorRow: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(answer.isVerified ? Color.green.opacity(0.18) : Color.orange.opacity(0.18))
                .frame(width: 44, height: 44)
                .overlay(
                    Text(String(answer.author.prefix(2)))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                )

            VStack(alignment: .leading, spacing: 3) {
                Text(answer.author)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(answer.role)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
    }

    private var sourceRow: some View {
        Group {
            if let source = answer.source {
                HStack(spacing: 5) {
                    Image(systemName: answer.isVerified ? "link.circle.fill" : "exclamationmark.circle")
                        .foregroundColor(answer.isVerified ? .secondary : .orange)

                    Text(answer.isVerified ? "Source: \(source)" : "Unverified source: \(source)")
                        .foregroundColor(answer.isVerified ? .secondary : .orange)
                }
                .font(.caption)
            }
        }
    }

    private var footerRow: some View {
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
}