import Kitura
import KituraStencil
import HeliumLogger
import KituraSession
import SwiftKuery
import SwiftKueryPostgreSQL

    // router config
    HeliumLogger.use()

    let router = Router()

router.all(middleware: [BodyParser()])
router.setDefault(templateEngine: StencilTemplateEngine())

router.get("/") { request, response, next in
    let user = request.parameters["user"] ?? "unknown"
    let connection = PostgreSQLConnection(host: localhost, port: 5432, options: [dabaseName: "school", userName: "Ash", password: "root"]?)

    
    try response.render("index", context: ["user" : user]).end()

        next()
    }

router.post("/test") { request, response, next in
    if let body = request.body {
        switch body {
        case .urlEncoded(let params):
            let pseudo = params["pseudo"] ?? "unknown"
            let msg = params["msg"] ?? "unknown"

            try response.render("index", context: ["pseudo" : pseudo, "msg" : msg ]).status(.OK).end()
            
        default:
            try response.redirect("/error").end()
        }
    }
    next()
}

    // Add an HTTP server and connect it to the router
    Kitura.addHTTPServer(onPort: 8080, with: router)
    
    // Start the Kitura runloop (this call never returns)
    Kitura.run()
