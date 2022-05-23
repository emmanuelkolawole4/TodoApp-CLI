//
//  CompleteCommand.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation
import ArgumentParser

struct CompleteCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "complete",
        abstract: "Marks a specific task as completed."
    )

    @Argument(help: "Check a task as completed.")
    private var id: Int

    func run() throws {
        let persistenceManager = PersistenceManagerImpl.shared
        persistenceManager.checkTask(at: id)
    }
}

