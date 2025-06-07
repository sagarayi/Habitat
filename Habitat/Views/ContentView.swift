//
//  ContentView.swift
//  Habitat
//
//  Created by Sagar Ayi on 6/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var habits: [Habit]
    @State private var showingAlert: Bool = false
    @State private var currentHabitName: String = ""

    var body: some View {
        HStack {
            VStack(alignment: .leading,  spacing: 20) {
                Spacer()
                Text("Habitat")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(habits) { habit in
                            HabitCardView(habit: habit)
                                .contextMenu {
                                    Button("Delete", role: .destructive) {
                                        if let index = habits.firstIndex(of: habit) {
                                            deleteHabit(offsets: IndexSet(integer: index))
                                        }
                                    }
                                }
                        }
                    }
                }
                HStack(alignment: .bottom) {
                    Button(action: {showingAlert.toggle()}) {
                        Image(systemName: "plus")
                    } .sheet(isPresented: $showingAlert) {
                        HabitInputView()
                    }
                    .frame(width: 80, height: 80, alignment: .center)
                    .presentationCornerRadius(25.0)
                    .background(Color.red.opacity(0.7))
                    .cornerRadius(50)
                    .shadow(radius: 5)
                    .fontWidth(.expanded)
                }
                .position(CGPoint(x: 330, y: 200))

                
            }
            .background {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.gray.opacity(0.6)]), startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
            }
        }
    }

    private func addHabit() {
        withAnimation {
            let newHabit = Habit(name: currentHabitName, startDate : Date())
            modelContext.insert(newHabit)
            currentHabitName = ""
        }
    }

    private func deleteHabit(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(habits[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Habit.self, inMemory: true)
}
