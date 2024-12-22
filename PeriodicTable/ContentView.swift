//
//  ContentView.swift
//  PeriodicTable
//

import SwiftUI

struct ContentView: View {
    // Variables
    @Namespace var animation
    @State private var selected: Element?
    var elements: [Element] = load("Elements.json")
    
    var body: some View {
        NavigationStack {
            ScrollView([.horizontal, .vertical]) {
                LazyHStack(alignment: .top) {
                    ForEach(1..<19) { column in
                        LazyVStack(alignment: .leading) {
                            ForEach(1..<10) { row in
                                // Display matching element based on column and row, otherwise display blank space
                                if let element = elements.first(where: { $0.column == column && $0.row == row }) {
                                    Button {
                                        selected = element
                                    } label: {
                                        ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: element.mass)
                                    }
                                    .matchedTransitionSource(id: element.id, in: animation)
                                } else {
                                    Rectangle()
                                        .frame(width: 100, height: 130)
                                        .opacity(0)
                                }
                            }
                        }
                    }
                }
                .sheet(item: $selected) { element in
                    // Allows for zoom transition to ElementDetailView when tapping an element
                    ElementDetailView(element: element, animation: animation)
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Periodic Table")
            .scrollIndicators(.hidden)
        }
    }
}

struct Element: Identifiable, Codable {
    var id: Int
    var element: String
    var symbol: String
    var mass: Double
    var row: Int
    var column: Int
}

func load<T: Decodable>(_ filename: String) -> T {
    let url = Bundle.main.url(forResource: filename, withExtension: nil)!
    
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't load \(filename): \(error)")
    }
}

#Preview {
    ContentView()
}
