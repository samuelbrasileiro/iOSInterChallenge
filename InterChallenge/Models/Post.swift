import Foundation

struct Post: TitleAndDescription {
    var title: String
    var description: String
    let uid: Int
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case uid = "id", userId, title, description="body"
    }
}
