//
//  NetworkingModel.swift
//  Networking_Jamal_Jones
//
//  Created by Consultant on 12/20/22.
//

import UIKit
import Foundation

func callSimpleApi() {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            return
        }
        
        if let data = data {
            let responseString = String(data: data, encoding: .utf8)
            print("Response: \(responseString)")
        }
    }
    
    task.resume()
}

//callSimpleApi()

struct TodoModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

func callApiAndImplementJSONDecoder() {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            return
        }
        
        if let data = data {
            do {
                let response = try JSONDecoder().decode(TodoModel.self, from: data)
                print(response.title)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    task.resume()
}


