import SwiftUI

struct FeedPostCard: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color.blue.opacity(0.18))
                    .frame(width: 34, height: 34)
                    .overlay(
                        Text(String(post.username.prefix(2)).uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    )

                VStack(alignment: .leading, spacing: 2) {
                    Text("\(post.username) · \(post.category) · \(post.timeAgo)")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text(post.question)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            HStack(spacing: 8) {
                if post.isVerified {
                    BadgeView(text: "Verified answer", color: .green)
                } else {
                    BadgeView(text: "Needs verified answer", color: .red)
                }

                if let source = post.source {
                    BadgeView(text: "Source: \(source)", color: .blue)
                }
            }

            HStack(spacing: 16) {
                Label("\(post.upvotes)", systemImage: "arrowtriangle.up.fill")
                Label("\(post.replies)", systemImage: "bubble.left")
                Spacer()
                BadgeView(text: post.status, color: post.isVerified ? .green : .orange)
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(18)
    }
}
