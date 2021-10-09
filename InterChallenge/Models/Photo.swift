import Foundation

struct Photo: Codable {
    let uid: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    enum CodingKeys: String, CodingKey {
        case uid="id", albumId, title, url, thumbnailUrl
    }
}
