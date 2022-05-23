//
//  PersistenceManagerImpl.swift
//  TodoApp-CLI
//
//  Created by FOLAHANMI KOLAWOLE on 20/05/2022.
//

import Foundation

final class PersistenceManagerImpl: IPersistenceManager {

    static let shared: PersistenceManagerImpl = PersistenceManagerImpl()

    // MARK: - Properties
    private lazy var taskList: [Task] = {
        let url = storageManager.documentsURL(name: filename)
        
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                let taskList = try [Task].self.mapFrom(url: url)!
                return taskList
            } catch {
                print("Error while reading from file: \(error)")
                return []
            }
        } else {
            createNewFile(at: url)
        }
        return taskList
    }()

    private let filename: String = "MyTasks"
    private let storageManager: StoreManagable = FileManager.default

    // MARK: - Initializer
    private init() {}

    // MARK: - Helper methods
    func getTasks() -> [Task] {
        return taskList
    }

    func add(_ task: Task) {
        if taskList.contains(task) {
            
        }
        taskList.append(task)
        save(taskList)
    }

    func checkTask(at idx: Int) {
        let safeIdx = idx - 1
        guard var completedTask = taskList[safe: safeIdx] else { return }
        completedTask.isCompleted = true

        taskList[safeIdx] = completedTask
        save(taskList)
    }

    func deleteTask(at idx: Int) {
        let safeIdx = idx - 1

        if taskList[safe: safeIdx] != nil {
            taskList.remove(at: safeIdx)
            save(taskList)
        }
    }

    // MARK: - Private helpers
    private func save(_ todos: [Task]) {
        let url = storageManager.documentsURL(name: filename)
        
        do {
            let data = try JSONEncoder().encode(todos)
            try data.write(to: url)
        } catch {
            print("Error while writing to file: \(error)")
        }
    }
    
    private func createNewFile(at url: URL) {
        do {
            let emptyData = try JSONEncoder().encode([Task]())
            try emptyData.write(to: url)
        } catch {
            print("Error creating json file: \(error)")
        }
    }
    
    private func readFromFile(at url: URL) {
        
    }
}
