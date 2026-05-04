import Foundation

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let category: String
    let timeAgo: String
    let question: String
    let status: String
    let source: String?
    let upvotes: Int
    let replies: Int
    let isVerified: Bool
}

struct Answer: Identifiable {
    let id = UUID()
    let author: String
    let role: String
    let text: String
    let source: String?
    let helpfulCount: Int
    let isVerified: Bool
}

struct Volunteer {
    let name: String
    let initials: String
    let title: String
    let languages: String
    let answers: Int
    let rating: Double
    let helpfulRate: Int
}
