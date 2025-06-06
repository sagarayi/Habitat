//
//  HabitCardView.swift
//  Habitat
//
//  Created by Sagar Ayi on 6/6/25.
//


import SwiftUI
import SwiftData

struct HabitCardView: View {
    var habit: Habit

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text(habit.name)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Text("Started: \(habit.startDate.formatted(date: .numeric, time: .omitted))")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .bottomLeading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.teal.opacity(0.9)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal)
    }
}

#Preview {
    HabitCardView(habit: Habit(name: "New Habit", startDate: Date()))
}
