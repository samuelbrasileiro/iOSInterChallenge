import Foundation

struct Comment: TitleAndDescription {
    var title: String
    var description: String
    let uid: Int
    let postId: Int
    enum CodingKeys: String, CodingKey {
        case uid = "id", postId, title = "name", description = "body"
    }
}
