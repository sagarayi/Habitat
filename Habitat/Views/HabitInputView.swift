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
    @State private var currentHabitName: String = ""
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter name of the Habit", text: $currentHabitName)
                    .navigationTitle("New Habit")
                DatePicker("Start Date", selection: .constant(Date()))
                    .datePickerStyle(.graphical)
                HStack {
                    Button("Add", action: {
                        dismiss()
                    })
                    Button("Close", action: {
                        dismiss()
                    })
                }
            }
        }
    }
}

#Preview {
    HabitInputView()
}
