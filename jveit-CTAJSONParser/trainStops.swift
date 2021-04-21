//
//  trainStops.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/18/21.
//

import Foundation

let blue =
    [
        stops(name: "O'Hare",
              type: .blue,
              mapId: "40890"
            ),
        stops(name: "Rosemont",
              type: .blue,
              mapId: "40820"
            ),
        stops(name: "Cumberland",
              type: .blue,
              mapId: "40230"
            ),
        stops(name: "Harlem",
              type: .blue,
              mapId: "40750"
            ),
        stops(name: "Jefferson Park",
              type: .blue,
              mapId: "41280"
            ),
        stops(name: "Montrose",
              type: .blue,
              mapId: "41330"
            ),
        stops(name: "Irving Park",
              type: .blue,
              mapId: "40550"
            ),
        stops(name: "Addison",
              type: .blue,
              mapId: "41240"
            ),
        stops(name: "Belmont",
              type: .blue,
              mapId: "40060"
            ),
        stops(name: "Logan Square",
              type: .blue,
              mapId: "41020"
            ),
        stops(name: "California",
              type: .blue,
              mapId: "40570"
            ),
        stops(name: "Western",
              type: .blue,
              mapId: "40670"
            ),
        stops(name: "Damen",
              type: .blue,
              mapId: "40590"
            ),
        stops(name: "Division",
              type: .blue,
              mapId: "40320"
            ),
        stops(name: "Chicago",
              type: .blue,
              mapId: "41440"
            ),
        stops(name: "Grand",
              type: .blue,
              mapId: "40490"
            ),
        stops(name: "Clark/Lake",
              type: .blue,
              mapId: "40380"
            ),
        stops(name: "Washington",
              type: .blue,
              mapId: "40370"
            ),
        stops(name: "Monroe",
              type: .blue,
              mapId: "40790"
            ),
        stops(name: "Jackson",
              type: .blue,
              mapId: "40070"
            ),
        stops(name: "LaSalle",
              type: .blue,
              mapId: "41340"
            ),
        stops(name: "Clinton",
              type: .blue,
              mapId: "40430"
            ),
        stops(name: "UIC-Halsted",
              type: .blue,
              mapId: "40350"
            ),
        stops(name: "Racine",
              type: .blue,
              mapId: "40470"
            ),
        stops(name: "Illinois",
              type: .blue,
              mapId: "40810"
            ),
        stops(name: "Western",
              type: .blue,
              mapId: "40220"
            ),
        stops(name: "Kedzie",
              type: .blue,
              mapId: "40250"
            ),
        stops(name: "Pulaski",
              type: .blue,
              mapId: "40920"
            ),
        stops(name: "Cicero",
              type: .blue,
              mapId: "40970"
            ),
        stops(name: "Austin",
              type: .blue,
              mapId: "40010"
            ),
        stops(name: "Oak Park",
              type: .blue,
              mapId: "40180"
            ),
        stops(name: "Harlem-Forest Park",
              type: .blue,
              mapId: "40980"
            ),
        stops(name: "Forest Park",
              type: .blue,
              mapId: "40390"
            )
    ]

let red =
    [
        stops(name: "Washington",
              type: .red,
              mapId: "40550"
            ),
        stops(name: "Jackson",
              type: .red,
              mapId: "40560"
            )
    ]


class stops
{
    
    enum `Type`: String
    {
        case blue = "blue"
        case red = "red"
        case yellow = "yellow"
        case orange = "orange"
        case brown = "brown"
        case pink = "pink"
        case purple = "purple"
        case green = "green"
    }
    
    var name: String
    var type: Type
    var mapId: String
    
    init(name: String, type: Type, mapId: String)
    {
        self.name = name
        self.type = type
        self.mapId = mapId
    }
    
}
