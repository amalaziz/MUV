//
//  File.swift
//  
//
//  Created by ama alothman on 28/08/1444 AH.
//

import Fluent
import Vapor

struct TodoController2: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("Movies")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.delete(use: delete)
        }
        todos.group(":todoID") { todo in
            todo.put(use: ubdate)
        }
    }

    func index(req: Request) async throws -> [Acronym] {
        try await Acronym.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Acronym {
        let todo = try req.content.decode(Acronym.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Acronym.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .noContent
    }
    func ubdate(req: Request) throws -> EventLoopFuture<Acronym>{
        let input = try req.content.decode(Acronym.self)
        return Acronym.find(req.parameters.get("todoID"), on: req.db).unwrap(or: Abort(.notFound)).flatMap {
            todo in todo.title = input.title
            return todo.save(on: req.db).map {
                Acronym(id :todo.id,title: todo.title, yearm: todo.yearm, description: todo.description,castname: todo.castname,avg_rate: todo.avg_rate)
            
            }
        }
    }
}

