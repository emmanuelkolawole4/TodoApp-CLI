//
//  Task.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation

struct Task: Codable, Hashable {
    let id: String
    let title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }

    static func == (lhs: Task,
            rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Task {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
