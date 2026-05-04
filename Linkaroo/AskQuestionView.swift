//
//  AskQuestionView.swift
//  Linkaroo
//
//  Created by Zahyaan Azmi on 4/5/2026.
//


import SwiftUI

struct AskQuestionView: View {
    @State private var question = ""
    @State private var category = "Healthcare"

    let categories = ["Healthcare", "Legal", "Education", "Housing", "Work", "Visa", "Banking"]

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            Form {
                Section("Your question") {
                    TextEditor(text: $question)
                        .frame(height: 140)
                }

                Section("Category") {
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { item in
                            Text(item)
                        }
                    }
                }

                Section {
                    Button {
                        question = ""
                        category = "Healthcare"
                    } label: {
                        Text("Post question")
                            .fontWeight(.bold)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Ask a question")
    }
}