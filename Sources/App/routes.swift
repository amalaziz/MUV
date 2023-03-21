import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // 1
    app.post("apiM") { req -> EventLoopFuture<Acronym> in
        // 2
        let acronym = try req.content.decode(Acronym.self)
        // 3
        return acronym.save(on: req.db).map {
            // 4
            acronym
        }
    }
    
    app.post("apiR") { req -> EventLoopFuture<FileB> in
        // 2
        let FileB = try req.content.decode(FileB.self)
        // 3
        return FileB.save(on: req.db).map {
            // 4
            FileB
        }
    }
    try app.register(collection: TodoController())
    try app.register(collection: TodoController2())
}

    
   // try app.register(collection: TodoController())

