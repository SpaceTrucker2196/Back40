import Vapor

struct UserAuthenticator: BearerAuthenticator {
    typealias User = App.User

    func authenticate(bearer: BearerAuthorization, for request: Request
    ) -> EventLoopFuture<Void> {

       return request.eventLoop.makeSucceededFuture(())
   }
}
