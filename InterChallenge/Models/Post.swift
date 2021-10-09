import Foundation

struct Post:TitleAndDescription {
    var title: String
    var description: String
    let id: Int
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, description="body"
    }
}
