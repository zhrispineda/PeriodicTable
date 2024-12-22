//
//  ElementModel.swift
//  PeriodicTable
//

import SwiftUI

class ElementModel {
    // For loading and decoding JSON files
    func load<T: Decodable>(_ filename: String) -> T {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)!
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't load \(filename): \(error)")
        }
    }
}

// MARK: Element Struct
struct Element: Identifiable, Codable {
    var id: Int
    var element: String
    var symbol: String
    var mass: Double
    var row: Int
    var column: Int
}
