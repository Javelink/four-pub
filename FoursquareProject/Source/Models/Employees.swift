//// To parse the JSON, add this file to your project and do:
////
////   let employees = try? newJSONDecoder().decode(Employees.self, from: jsonData)
//
import Foundation

struct Employees: Codable {
    let meta: Meta
    let response: Response
}
