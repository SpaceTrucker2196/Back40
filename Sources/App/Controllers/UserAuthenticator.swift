import Vapor

//struct UserAuthenticator: BearerAuthenticator {
//    typealias User = App.User
//
//    func authenticate( basic: BasicAuthorization, for request: Request ) -> EventLoopFuture<Void> {
//        if basic.username == "test" && basic.password == "secret" {
//            request.auth.login(User(name: "Vapor"))
//        }
//        return request.eventLoop.makeSucceededFuture(())
//   }
//}
