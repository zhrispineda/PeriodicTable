//
//  ContentView.swift
//  PeriodicTable
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView([.horizontal, .vertical]) {
                ForEach(1..<10) { column in
                    LazyVStack(alignment: .leading) {
                        LazyHStack(alignment: .top) {
                            ForEach(1..<19) { row in
                                Button {} label: {
                                    ElementView(element: "Hydrogen", symbol: "H", atomicNumber: 1, atomicMass: 1.0078)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Periodic Table")
            .scrollIndicators(.hidden)
        }
    }
}

struct ElementView: View {
    let element: String
    let symbol: String
    let atomicNumber: Int
    let atomicMass: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("\(atomicNumber)") // Atomic Number
                Spacer()
                Text("\(atomicMass, specifier: "%.4f")") // Atomic Mass
            }
            Spacer()
            Text(symbol) // Symbol
                .fontWeight(.bold)
                .font(.system(size: 50))
            Spacer()
            Text(element) // Element
        }
        .foregroundStyle(.white)
        .padding()
        .frame(width: 100, height: 130)
        .font(.footnote)
        .background(Color.blue.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    ContentView()
}
