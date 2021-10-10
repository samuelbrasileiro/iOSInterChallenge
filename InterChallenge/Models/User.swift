import Foundation

struct User: Codable {
    let uid: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case uid = "id", name, username, email, phone
    }
}
