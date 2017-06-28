
// -------------- Models
class Brochure {
  var id : String = "BrochureID"
}

class Publisher {
  var id : String = "PublisherID"
}

// -------------- Json Parser
protocol iJsonParser {
  associatedtype ReturnType
  func parseJson(json: String) -> [ReturnType]
}
class BrohureJsonParser: iJsonParser {
  func parseJson(json: String) -> [Brochure] {
    return [Brochure(), Brochure()]
  }
}
class PublisherJsonParser: iJsonParser {
  func parseJson(json: String) -> [Publisher] {
    return [Publisher(), Publisher()]
  }
}

// -------------- Generic Service
class RestApiService<Element, ParserType: iJsonParser where ParserType.ReturnType == Element> {
  
  func getBrochures(jsonString: String, parser: ParserType) -> [Element] {
    return parser.parseJson(jsonString)
  }
}

// -------------- Specific Service Subclass
class brochureRestApiService : RestApiService<Brochure, BrohureJsonParser>{
  let brochureParser = BrohureJsonParser()
  
  func getBrochures(jsonString: String) -> [Brochure] {
    return getBrochures(jsonString, parser: brochureParser)
  }
}

// use it directly
let publisherService = RestApiService<Publisher, PublisherJsonParser>()
let publisherParser = PublisherJsonParser()
publisherService.getBrochures("kinda_json_string", parser: publisherParser)

// use via specific subclass
let brochureService = brochureRestApiService()
brochureService.getBrochures("kinda_json_string")

