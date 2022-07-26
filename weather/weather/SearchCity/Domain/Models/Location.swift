import Foundation


class Location :ObservableObject, Codable, Identifiable  {
    let id: String = UUID().uuidString
    var name : String?
    var local_names : Local_names?
    var lat : Double?
    var lon : Double?
    var country : String?
    var state : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case local_names = "local_names"
		case lat = "lat"
		case lon = "lon"
		case country = "country"
		case state = "state"
	}

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		local_names = try values.decodeIfPresent(Local_names.self, forKey: .local_names)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		state = try values.decodeIfPresent(String.self, forKey: .state)
	}
    
    init() {
        name = ""
        lat = 0.0
        lon = 0.0
        country = ""
        state = ""
    }
    

}
