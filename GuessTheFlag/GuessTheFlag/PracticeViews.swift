//
//  PracticeViews.swift
//  GuessTheFlag
//
//  Created by Shabbir on 29/09/24.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2") {}
                .buttonStyle(.borderedProminent)
            Button("Button 3") {}
                .buttonStyle(.bordered)
                .tint(.mint)
            Button {
                deleteSelection()
            } label: {
                Text("Delete")
                    .padding()
                    .foregroundColor(.red)
                    .background(.teal)
            }
            Button {
                deleteSelection()
            } label: {
                Image(systemName: "pencil")
                    .padding()
                    .background(.yellow)
            }
            Button {
                deleteSelection()
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .background(.mint)
            }
        }
    }

    func deleteSelection() {
        print("Now deleting...")
    }
}

struct MyViewWithAlert: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Alert Title!", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {
                print("Record deleted!!!")
            }
            Button("Cancel", role: .cancel) {
                print("You cancelled the deletion")
            }
        } message: {
            Text("This is the alert message 1.")
        }
    }
}

#Preview {
    MyViewWithAlert()
}
