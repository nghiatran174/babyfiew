import Foundation

protocol TokenManagerProtocol {
    func isAccessTokenValid() -> Bool
    func fetchAccessToken() -> String
    func isRefreshTokenValid() -> Bool
    func fetchRefreshToken() -> String
    func refreshWith(apiToken: APIToken) throws
}

class TokenManager {
    private let userDefaults: UserDefaults
    private var accessToken: String?
    private var refreshToken: String?
    private var accessTokenExpiresAt = Date()
    private var refreshTokenExpiresAt = Date()

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        update()
    }
}

extension TokenManager: TokenManagerProtocol {
    func isAccessTokenValid() -> Bool {
        update()
        return accessToken != nil && accessTokenExpiresAt.compare(Date()) == .orderedDescending
    }
    
    func isRefreshTokenValid() -> Bool {
        update()
        return refreshToken != nil && refreshTokenExpiresAt.compare(Date()) == .orderedDescending
    }

    func fetchAccessToken() -> String {
        guard let token = accessToken else {
            return ""
        }
        return token
    }
    
    func fetchRefreshToken() -> String {
        guard let token = refreshToken else {
            return ""
        }
        return token
    }

  func refreshWith(apiToken: APIToken) throws {
      save(token: apiToken)
      self.accessTokenExpiresAt = apiToken.accessTokenExpiresAt
      self.accessToken = apiToken.bearerAccessToken
  }
}

extension TokenManager {
  func save(token: APIToken) {
    userDefaults.set(token.accessTokenExpiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.accessTokenExpiresAt)
    userDefaults.set(token.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
      
      if let _ = token.refreshToken {
          userDefaults.set(token.refreshTokenExpiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.refreshTokenExpiresAt)
          userDefaults.set(token.bearerRefreshToken, forKey: AppUserDefaultsKeys.bearerRefreshToken)
      }
  }

  func getExpirationDate() -> (Date, Date) {
      (Date(timeIntervalSince1970: userDefaults.double(forKey: AppUserDefaultsKeys.accessTokenExpiresAt)),
       Date(timeIntervalSince1970: userDefaults.double(forKey: AppUserDefaultsKeys.refreshTokenExpiresAt)))
  }

  func getToken() -> (String?, String?) {
      (userDefaults.string(forKey: AppUserDefaultsKeys.bearerAccessToken),
       userDefaults.string(forKey: AppUserDefaultsKeys.bearerRefreshToken))
  }

  func update() {
    (accessToken, refreshToken) = getToken()
    (accessTokenExpiresAt, refreshTokenExpiresAt) = getExpirationDate()
  }
}
