//
//  DeleteTaskCommand.swift
//  ArgumentParser
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation
import ArgumentParser


struct DeleteTaskCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "delete",
        abstract: "Deletes a specific task from the list of saved tasks."
    )

    @Argument(help: "The id of the task to be deleted.")
    private var id: Int

    func run() throws {
        let persistenceManager = PersistenceManagerImpl.shared
        persistenceManager.deleteTask(at: id)
    }
}
