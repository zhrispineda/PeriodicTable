//
//  ContentView.swift
//  PeriodicTable
//

import SwiftUI

struct ContentView: View {
    // Variables
    @State private var currentTab: Tabs = .periodicTable
    
    enum Tabs {
        case periodicTable, information, settings
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            Tab("Elements", systemImage: "atom", value: .periodicTable) {
                PeriodicTableView()
            }
            
            Tab("Information", systemImage: "info.circle", value: .information) {
                EmptyView()
            }
            
            Tab("Settings", systemImage: "gear", value: .settings) {
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
