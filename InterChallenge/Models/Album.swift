import Foundation

struct Album: Codable {
    let uid: Int
    let userId: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case uid = "id", userId, title
    }
}
