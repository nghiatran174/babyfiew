import Foundation

struct APIToken {
    let tokenType: String
    let accessTokenExpiresIn: Int
    let accessToken: String
    let refreshTokenExpiresIn: Int?
    let refreshToken: String?
    
    private let requestedAt = Date()
}

extension APIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case tokenType
        case accessTokenExpiresIn
        case accessToken
        case refreshTokenExpiresIn
        case refreshToken
    }
}

extension APIToken {
    var accessTokenExpiresAt: Date {
        Calendar.current.date(byAdding: .second, value: accessTokenExpiresIn, to: requestedAt) ?? Date()
    }
    
    var refreshTokenExpiresAt: Date {
        Calendar.current.date(byAdding: .day, value: refreshTokenExpiresIn ?? 0, to: requestedAt) ?? Date()
    }

    var bearerAccessToken: String {
        "\(tokenType) \(accessToken)"
    }
    
    var bearerRefreshToken: String {
        "\(tokenType) \(refreshToken ?? "")"
    }
}
