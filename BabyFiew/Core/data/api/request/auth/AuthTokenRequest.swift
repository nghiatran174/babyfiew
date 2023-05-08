enum AuthTokenRequest: RequestProtocol {
    case auth(userName: String, password: String)
    case refresh(refreshToken: String)

  var path: String {
    "/api/token"
  }

  var params: [String: Any] {
      switch self {
      case let .auth(userName, password):
          var params = ["userName": userName]
          params["password"] = password
          return params
      case let .refresh(refreshToken):
          return ["refresh_token": refreshToken]
      }
  }

  var addAuthorizationToken: Bool {
      false
  }

  var requestType: RequestType {
      .POST
  }
}
