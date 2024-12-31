//
//  SettingsView.swift
//  PeriodicTable
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Acknowledgements") {
                    Link("American Chemistry Society", destination: URL(string: "https://www.acs.org/")!)
                    Link("Western Oregon University", destination: URL(string: "https://people.wou.edu")!)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
