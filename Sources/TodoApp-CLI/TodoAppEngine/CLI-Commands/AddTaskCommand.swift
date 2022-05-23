//
//  AddTaskCommand.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation
import ArgumentParser

struct AddTaskCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "add",
        abstract: "Adds a new task to a list of saved tasks."
    )

    @Argument(help: "The title of the task")
    private var title: String

    @Option(name: .shortAndLong, help: "Indicates if this task has already been completed before been listed.")
    private var isCompleted: Bool = false

    func run() throws {
        let newTask: Task = Task(title: title)
        let persistenceManager = PersistenceManagerImpl.shared
        persistenceManager.add(newTask)
    }
}
