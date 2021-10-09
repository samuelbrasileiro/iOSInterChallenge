import Foundation

struct Comment: TitleAndDescription {
    var title: String
    var description: String
    let id: Int
    let postId: Int

    
    enum CodingKeys: String, CodingKey {
        case id, postId, title="name", description="body"
    }
}
