//
//  FileManager Helper.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 23.08.22.
//

import UIKit

class FileManagerHelper {
    
    static let shared = FileManagerHelper()
    
    //MARK: Documents directory path
    let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    //MARK: Load directories
    func loadDirectories() -> Result<[String], Error> {
        
        let path = documentsUrl.path
        
        do {
            // Getting directory names and leaving out .DS_Store outside the directory array
            let directories = try FileManager.default.contentsOfDirectory(atPath: path).filter { $0 != ".DS_Store" }
            return .success(directories)
        } catch {
            return .failure(error)
        }
        
    }
    
    //MARK: Load reminders at given directory
    func loadReminders(currentDirectory: String) -> Result<[String: String], Error> {

        var url = documentsUrl
        
        url.appendPathComponent(currentDirectory)
        
        let path = url.path
        
        do {
            
            // Getting reminder names and leaving out .DS_Store outside the reminders array
            let remindersArray = try FileManager.default.contentsOfDirectory(atPath: path).filter { $0 != ".DS_Store" }
            
            var remindersDictionary: [String: String] = [:]
            
            remindersArray.forEach { reminder in
                url = documentsUrl

                url.appendPathComponent(currentDirectory)
                url.appendPathComponent(reminder)

                guard let reminderData = FileManager.default.contents(atPath: url.path) else { return }
                
                let reminderDetails = String(decoding: reminderData, as: UTF8.self)
                let reminderName = reminder.replacingOccurrences(of: ".txt", with: "")
                
                remindersDictionary[reminderName] = reminderDetails
            }
            
            return .success(remindersDictionary)
            
        } catch {
            return .failure(error)
        }
        
    }
    
    //MARK: Add directories with given name
    func addDirectory(named name: String) {
        
        var url = documentsUrl
        
        url.appendPathComponent(name)
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: Add reminder at given directory with given name and data
    func addReminderFile(currentDirectory: String, named name: String, data: String) {
        
        var url = documentsUrl
        
        url.appendPathComponent(currentDirectory)
        url.appendPathComponent("\(name).txt")
        
        let textData = data.data(using: .utf8)!
        
        FileManager.default.createFile(atPath: url.path, contents: textData)
    }
    
    //MARK: Delete directory
    func deleteDirectory(at directoryName: String) {
        
        var url = documentsUrl
        
        url.appendPathComponent(directoryName)
        
        do {
            try FileManager.default.removeItem(at: url)
        }
        
        catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: Delete reminder at given directory
    func deleteReminder(currentDirectory: String, at reminderName: String) {
        
        var url = documentsUrl
        
        url.appendPathComponent(currentDirectory)
        url.appendPathComponent("\(reminderName).txt")
        
        do {
            try FileManager.default.removeItem(at: url)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    

}
