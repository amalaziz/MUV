//
//  File.swift
//  
//
//  Created by ama alothman on 24/08/1444 AH.


import Vapor
import Fluent

// 1
final class FileB: Content, Model {
  // 2
  static let schema = "reviews"
  
  // 3
  @ID
  var id: UUID?
  
  // 4
  @Field(key: "movie_id")
  var movie_id: UUID?
    
  @Field(key: "titlem")
  var titlem: String

  @Field(key: "contentreview")
  var contentreview: String
    
  @Field(key: "rate")
  var rate: Float
  
  // 5
  init() {}
  
  // 6
    init(id: UUID? = nil, movie_id : UUID?,titlem: String, contentreview: String, rate: Float) {
    self.id = id
    self.movie_id = movie_id
    self.titlem = titlem
    self.contentreview = contentreview
    self.rate = rate
  }
}
