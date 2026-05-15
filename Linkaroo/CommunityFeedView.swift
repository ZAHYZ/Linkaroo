import SwiftUI

struct CommunityFeedView: View {
    let posts: [Post] = [
        Post(
            username: "yuki_k",
            category: "Healthcare",
            timeAgo: "5h ago",
            question: "What vaccinations do I need to update when arriving in Australia?",
            status: "Answered",
            source: "health.gov.au",
            upvotes: 23,
            replies: 4,
            isVerified: true
        ),
        Post(
            username: "ali_m",
            category: "Legal",
            timeAgo: "2h ago",
            question: "Can I work full-time on a bridging visa A while waiting for my PR?",
            status: "Needs answer",
            source: nil,
            upvotes: 11,
            replies: 2,
            isVerified: false
        ),
        Post(
            username: "pham_w",
            category: "Education",
            timeAgo: "1d ago",
            question: "Which suburbs have the best public schools for primary-age kids?",
            status: "Community discussion",
            source: nil,
            upvotes: 7,
            replies: 12,
            isVerified: false
        )
    ]

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(posts) { post in
                            NavigationLink {
                                ThreadView()
                            } label: {
                                FeedPostCard(post: post)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }

    private var header: some View {
        HStack {
            Text("Linkaroo")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Spacer()
        }
        .padding()
        .background(Color.appBackground)
    }
}