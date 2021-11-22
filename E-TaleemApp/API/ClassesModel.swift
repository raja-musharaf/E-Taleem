//
//  Classes.swift
//  E-TaleemApp
//
//  Created by apple on 16/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//


import Foundation
import Alamofire

struct ClassesBase : Codable {
    let data : ClassesData?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ClassesData.self, forKey: .data)
    }
    
}

struct ClassesData : Codable {
    let id : Int?
    let title : String?
    let slug : String?
    let classes : [Classes]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case slug = "slug"
        case classes = "classes"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        classes = try values.decodeIfPresent([Classes].self, forKey: .classes)
    }
    
}

struct Classes : Codable {
    let id : Int
    let title : String
    let tag : String
    let icon : String
    let svg : String
    let color : String
    let web_service : String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case tag = "tag"
        case icon = "icon"
        case svg = "svg"
        case color = "color"
        case web_service = "web_service"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)!
        title = try values.decodeIfPresent(String.self, forKey: .title)!
        tag = try values.decodeIfPresent(String.self, forKey: .tag)!
        icon = try values.decodeIfPresent(String.self, forKey: .icon)!
        svg = try values.decodeIfPresent(String.self, forKey: .svg)!
        color = try values.decodeIfPresent(String.self, forKey: .color)!
        web_service = try values.decodeIfPresent(String.self, forKey: .web_service)!
    }
    
}

