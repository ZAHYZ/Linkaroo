import SwiftUI

struct ThreadView: View {
    let answers: [Answer] = [
        Answer(
            author: "Sarah A.",
            role: "Settlement worker · 4 yrs experience · 98% helpful",
            text: "You can register at any Medicare service centre — bring your visa grant letter and passport. Processing takes about 10 working days, and your card will arrive by mail.",
            source: "servicesaustralia.gov.au",
            helpfulCount: 31,
            isVerified: true
        ),
        Answer(
            author: "minh_k",
            role: "Community member",
            text: "I heard you can also do it online through MyGov but I'm not 100% sure about PR visa holders specifically.",
            source: "TikTok · unverified",
            helpfulCount: 8,
            isVerified: false
        )
    ]

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    BadgeView(text: "Healthcare", color: .blue)

                    Text("How do I register for Medicare as a new permanent resident?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .lineSpacing(4)

                    Text("Asked by linh_hn · 3 days ago")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("3 ANSWERS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)

                    ForEach(answers) { answer in
                        if answer.isVerified {
                            NavigationLink {
                                VolunteerProfileView()
                            } label: {
                                AnswerCardView(answer: answer)
                            }
                            .buttonStyle(.plain)
                        } else {
                            AnswerCardView(answer: answer)
                        }
                    }

                    personalisedHelpCard
                }
                .padding()
            }
        }
        .navigationTitle("Medicare")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var personalisedHelpCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Need personalised help?")
                    .font(.headline)
                    .foregroundColor(.white)

                Text("Connect with Sarah A. — settlement specialist")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.75))
            }

            Spacer()

            NavigationLink {
                ConnectHelpView()
            } label: {
                Text("Connect")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(18)
    }
}