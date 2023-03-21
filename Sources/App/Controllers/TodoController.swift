import Fluent
import Vapor

struct TodoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("Reviews")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.delete(use: delete)
        }
        todos.group(":todoID") { todo in
            todo.put(use: ubdate)
        }
    }

    func index(req: Request) async throws -> [FileB] {
        try await FileB.query(on: req.db).all()
    }

    func create(req: Request) async throws -> FileB {
        let todo = try req.content.decode(FileB.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await FileB.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .noContent
    }
    func ubdate(req: Request) throws -> EventLoopFuture<FileB>{
        let input = try req.content.decode(FileB.self)
        return FileB.find(req.parameters.get("todoID"), on: req.db).unwrap(or: Abort(.notFound)).flatMap {
            todo in todo.titlem = input.titlem
            return todo.save(on: req.db).map {
                FileB(id :todo.id, movie_id : todo.movie_id, titlem: todo.titlem, contentreview: todo.contentreview, rate: todo.rate)
            }
        }
    }
}
