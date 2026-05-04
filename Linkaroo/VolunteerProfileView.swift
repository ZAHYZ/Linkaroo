//
//  VolunteerProfileView.swift
//  Linkaroo
//
//  Created by Zahyaan Azmi on 4/5/2026.
//


import SwiftUI

struct VolunteerProfileView: View {
    let volunteer = Volunteer(
        name: "Sarah Antonescu",
        initials: "SA",
        title: "Settlement & visa guidance",
        languages: "Speaks Romanian, English, basic Mandarin",
        answers: 214,
        rating: 4.9,
        helpfulRate: 98
    )

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    profileHeader
                    statsRow
                    certifications
                    reviews
                }
                .padding()
            }
        }
        .navigationTitle("Volunteer profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var profileHeader: some View {
        HStack(alignment: .top, spacing: 16) {
            Circle()
                .fill(Color.green.opacity(0.3))
                .frame(width: 70, height: 70)
                .overlay(
                    Text(volunteer.initials)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                )

            VStack(alignment: .leading, spacing: 8) {
                Text(volunteer.name)
                    .font(.title3)
                    .fontWeight(.bold)

                Text("\(volunteer.title) · \(volunteer.languages)")
                    .font(.subheadline)

                HStack {
                    BadgeView(text: "ID verified", color: .blue)
                    BadgeView(text: "Mod certified", color: .green)
                }

                BadgeView(text: "Professional", color: .purple)
            }
        }
    }

    private var statsRow: some View {
        HStack {
            StatView(number: "\(volunteer.answers)", label: "Answers")
            Spacer()
            StatView(number: "\(volunteer.rating)", label: "Rating")
            Spacer()
            StatView(number: "\(volunteer.helpfulRate)%", label: "Helpful rate")
        }
    }

    private var certifications: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("CERTIFICATIONS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)

            CertificationRow(
                title: "MARA registered migration agent",
                subtitle: "Office of the MARA · Exp. Dec 2026"
            )

            CertificationRow(
                title: "Working with Vulnerable People",
                subtitle: "ACT Government · Verified"
            )
        }
    }

    private var reviews: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("RECENT REVIEWS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)

            ReviewView(
                text: "Sarah explained the Medicare process step by step and even helped me find the right office near me.",
                author: "linh_hn · 3 days ago"
            )

            ReviewView(
                text: "Very patient and knew exactly what documents I needed. Highly recommend.",
                author: "roza_m · 1 week ago"
            )
        }
    }
}