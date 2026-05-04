import SwiftUI

struct StatView: View {
    let number: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(number)
                .font(.title2)
                .fontWeight(.bold)

            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct CertificationRow: View {
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.square.fill")
                .foregroundColor(.green)
                .font(.title3)

            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(14)
    }
}

struct ReviewView: View {
    let text: String
    let author: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("★★★★★")
                .foregroundColor(.orange)

            Text("\"\(text)\"")
                .font(.subheadline)

            Text("— \(author)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

extension Color {
    static let appBackground = Color(red: 0.96, green: 0.95, blue: 0.92)
    static let cardBackground = Color(red: 0.99, green: 0.98, blue: 0.95)
}
