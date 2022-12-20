//
//  NetworkingModel.swift
//  Networking_Jamal_Jones
//
//  Created by Consultant on 12/20/22.
//

import UIKit
import Foundation

struct NetworkingModel {
    
    var articles:[Article]?
    
    mutating func loadJson(filename fileName: String) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                self.articles = jsonData.articles
            } catch {
                print("error:\(error)")
            }
        }
        
    }
    
}

struct Article:Codable {
    
    let id:String
    let source:String
    let title:String
    
    func loadImage() -> UIImage? {
        let imageName = "image\(self.id)"
        let image = UIImage(named: imageName)
        return image
    }
    
}


struct ResponseData: Decodable {
    var articles: [Article]
}


