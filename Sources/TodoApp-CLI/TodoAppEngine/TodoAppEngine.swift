//
//  TodoAppEngine.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation
import ArgumentParser

public struct TodoAppEngine: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "todo",
        abstract: "A Swift command-line Todo App tool to manage tasks",
        subcommands: [
            AddTaskCommand.self,
            ListTasksCommand.self,
            CompleteCommand.self,
            DeleteTaskCommand.self,
        ]
    )

    public init() {}
}
