//
//  Extensions.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation

extension Collection {
    /// Returns the element at the given index
    /// if it is within range, otherwise nil
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


protocol StoreManagable {
    func documentsURL(name: String) -> URL
}

extension FileManager: StoreManagable {
    func documentsURL(name: String) -> URL {
        guard let documentURL = urls(
            for: .documentDirectory,
               in: .userDomainMask).first
        else {
            fatalError()
        }

        return documentURL.appendingPathComponent(name)
    }
}


public extension Decodable {
    ///Maps URL to actual Decodable Object
    ///throws an exception if mapping fails
    static func mapFrom(url: URL) throws -> Self? {
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Self.self, from: Data(contentsOf: url))
    }
}
