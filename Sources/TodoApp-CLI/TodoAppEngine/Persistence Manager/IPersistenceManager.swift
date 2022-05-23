//
//  IPersistenceManager.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation

protocol IPersistenceManager {
    func add(_ todo: Task)
    func checkTask(at index: Int)
    func deleteTask(at index: Int)
}
