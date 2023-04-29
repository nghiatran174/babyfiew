protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
  let apiManager: APIManagerProtocol
  let parser: DataParserProtocol
  let tokenManager: TokenManagerProtocol

  init(
    apiManager: APIManagerProtocol = APIManager(),
    parser: DataParserProtocol = DataParser(),
    tokenManager: TokenManagerProtocol = TokenManager()
  ) {
    self.apiManager = apiManager
    self.parser = parser
    self.tokenManager = tokenManager
  }

  func requestAccessToken() async throws -> String {
      if tokenManager.isAccessTokenValid(){
        return tokenManager.fetchAccessToken()
      }

      guard tokenManager.isRefreshTokenValid() else {
          throw NetworkError.tokenExpired
      }
      let data = try await apiManager.requestToken(refreshToken: tokenManager.fetchRefreshToken())
      let token: APIToken = try parser.parse(data: data)
      try tokenManager.refreshWith(apiToken: token)
      return token.bearerAccessToken
  }

  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let authToken = try await requestAccessToken()
    let data = try await apiManager.perform(request, authToken: authToken)
    let decoded: T = try parser.parse(data: data)
    return decoded
  }
}
