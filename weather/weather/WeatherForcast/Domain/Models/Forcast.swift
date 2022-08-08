import Foundation
struct Forcast : Codable,Identifiable {
    var id: String?
	let cod : String?
	let message : Int?
	let cnt : Int?
	let list : [ForcastList]?
	let city : City?

	enum CodingKeys: String, CodingKey {

		case cod = "cod"
		case message = "message"
		case cnt = "cnt"
		case list = "list"
		case city = "city"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cod = try values.decodeIfPresent(String.self, forKey: .cod)
		message = try values.decodeIfPresent(Int.self, forKey: .message)
		cnt = try values.decodeIfPresent(Int.self, forKey: .cnt)
		list = try values.decodeIfPresent([ForcastList].self, forKey: .list)
		city = try values.decodeIfPresent(City.self, forKey: .city)
	}

}
