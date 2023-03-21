//
//  File.swift
//  
//
//  Created by ama alothman on 24/08/1444 AH.
//

import Vapor
import Fluent

// 1
final class Acronym: Content, Model {
  // 2
  static let schema = "movies"
  
  // 3
  @ID
  var id: UUID?
  
  // 4
  @Field(key: "title")
  var title: String
  
  @Field(key: "yearm")
  var yearm: Int

  @Field(key: "description")
  var description: String
    
  @Field(key: "castname")
  var castname: String
    
  @Field(key: "avg_rate")
  var avg_rate: Float
  
  // 5
  init() {}
  
  // 6
    init(id: UUID? = nil, title: String, yearm: Int,description: String, castname:String, avg_rate: Float) {
    self.id = id
    self.title = title
    self.yearm = yearm
    self.description = description
    self.castname = castname
    self.avg_rate = avg_rate
  }
}
