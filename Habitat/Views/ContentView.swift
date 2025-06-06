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
        NavigationSplitView {
            List {
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
                .padding()
            }
            .listStyle(.plain)
            .navigationTitle("Habitat")
            .background(Color.clear)
            .listRowSeparator(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {showingAlert.toggle()}) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $showingAlert) {
                        HabitInputView()
                    }
                }
            }
        } detail: {
            Text("Select a Habit")
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
