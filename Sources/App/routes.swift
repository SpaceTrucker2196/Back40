import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "Back40 M&P V 0.1a"
    }
}
