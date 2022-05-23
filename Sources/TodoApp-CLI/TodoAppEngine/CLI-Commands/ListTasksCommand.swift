//
//  ListTasksCommand.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation
import ArgumentParser


struct ListTasksCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "Lists the already saved tasks."
    )

    func run() throws {
        let persistenceManager = PersistenceManagerImpl.shared
        let tasks: [Task] = persistenceManager.getTasks()

        if tasks.count > 0 {
            for (index, task) in tasks.enumerated() {
                task.isCompleted ? print("(\(index + 1)*) \(task.title)") : print("(\(index + 1)) \(task.title)")
            }
        } else {
            debugPrint(tasks)
        }
    }
}
