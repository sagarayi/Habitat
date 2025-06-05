//
//  HabitInputView.swift
//  Habitat
//
//  Created by Sagar Ayi on 6/3/25.
//
import SwiftUI
import SwiftData

struct HabitInputView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var currentHabitName: String = ""
    @State private var habbitStartDate: Date = Date()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.6)]), startPoint: .bottom, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("New Habit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                TextField("Enter name of the Habit", text: $currentHabitName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.systemGray6).opacity(0.5))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                DatePicker("Start Date", selection: $habbitStartDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding(.horizontal)

                HStack(spacing: 20) {
                    Button("Add") {
                        storeHabit()
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Close") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    private func storeHabit() {
        let habit = Habit(name: currentHabitName, startDate: habbitStartDate)
        modelContext.insert(habit)
    }
}

#Preview {
    HabitInputView()
}
