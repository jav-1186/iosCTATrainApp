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
        stops(name: "Howard",
              type: .red,
              mapId: "40900"
            ),
        stops(name: "Jarvis",
              type: .red,
              mapId: "41190"
            ),
        stops(name: "Morse",
              type: .red,
              mapId: "40100"
            ),
        stops(name: "Loyola",
              type: .red,
              mapId: "41300"
            ),
        stops(name: "Granville",
              type: .red,
              mapId: "40760"
            ),
        stops(name: "Thorndale",
              type: .red,
              mapId: "40880"
            ),
        stops(name: "Bryn Mawr",
              type: .red,
              mapId: "41380"
            ),
        stops(name: "Berwyn",
              type: .red,
              mapId: "40340"
            ),
        stops(name: "Argyle",
              type: .red,
              mapId: "41200"
            ),
        stops(name: "Lawrence",
              type: .red,
              mapId: "40770"
            ),
        stops(name: "Wilson",
              type: .red,
              mapId: "40540"
            ),
        stops(name: "Sheridan",
              type: .red,
              mapId: "40080"
            ),
        stops(name: "Addison",
              type: .red,
              mapId: "41420"
            ),
        stops(name: "Belmont",
              type: .red,
              mapId: "41320"
            ),
        stops(name: "Fullerton",
              type: .red,
              mapId: "41220"
            ),
        stops(name: "North/Clybourn",
              type: .red,
              mapId: "40650"
            ),
        stops(name: "Clark/Division",
              type: .red,
              mapId: "40630"
            ),
        stops(name: "Chicago",
              type: .red,
              mapId: "41450"
            ),
        stops(name: "Grand",
              type: .red,
              mapId: "40330"
            ),
        stops(name: "Lake",
              type: .red,
              mapId: "41660"
            ),
        stops(name: "Monroe",
              type: .red,
              mapId: "41090"
            ),
        stops(name: "Jackson",
              type: .red,
              mapId: "40560"
            ),
        stops(name: "Harrison",
              type: .red,
              mapId: "41490"
            ),
        stops(name: "Roosevelt",
              type: .red,
              mapId: "41400"
            ),
        stops(name: "Cermak-Chinatown",
              type: .red,
              mapId: "41000"
            ),
        stops(name: "Sox-35th",
              type: .red,
              mapId: "40190"
            ),
        stops(name: "47th",
              type: .red,
              mapId: "41230"
            ),
        stops(name: "Garfield",
              type: .red,
              mapId: "41170"
            ),
        stops(name: "63rd",
              type: .red,
              mapId: "40910"
            ),
        stops(name: "69th",
              type: .red,
              mapId: "40990"
            ),
        stops(name: "79th",
              type: .red,
              mapId: "40240"
            ),
        stops(name: "87th",
              type: .red,
              mapId: "41430"
            ),
        stops(name: "95th",
              type: .red,
              mapId: "40450"
            )
    ]

    let orange =
    [
        stops(name: "Midway",
              type: .orange,
              mapId: "40930"
            ),
        stops(name: "Pulaski",
              type: .orange,
              mapId: "40960"
            ),
        stops(name: "Kedzie",
              type: .orange,
              mapId: "41150"
            ),
        stops(name: "Western",
              type: .orange,
              mapId: "40310"
            ),
        stops(name: "35th/Archer",
              type: .orange,
              mapId: "40120"
            ),
        stops(name: "Ashland",
              type: .orange,
              mapId: "41060"
            ),
        stops(name: "Halsted",
              type: .orange,
              mapId: "41130"
            ),
        stops(name: "Roosevelt",
              type: .orange,
              mapId: "41400"
            ),
        stops(name: "Harold Washington Library",
              type: .orange,
              mapId: "40850"
            ),
        stops(name: "LaSalle/Van Buren",
              type: .orange,
              mapId: "40160"
            ),
        stops(name: "Quincy/Wells",
              type: .orange,
              mapId: "40040"
            ),
        stops(name: "Washinton/Wells",
              type: .orange,
              mapId: "40730"
            ),
        stops(name: "Clark/Lake",
              type: .orange,
              mapId: "40380"
            ),
        stops(name: "State/Lake",
              type: .orange,
              mapId: "40260"
            ),
        stops(name: "Washington/Wabash",
              type: .orange,
              mapId: "41700"
            ),
        stops(name: "Adams/Wabash",
              type: .orange,
              mapId: "40680"
            )
    ]

   let yellow =
    [
        stops(name: "Howard",
              type: .yellow,
              mapId: "40900"
            ),
        stops(name: "Oakton-Skokie",
              type: .yellow,
              mapId: "41680"
            ),
        stops(name: "Dempster-Skokie",
              type: .yellow,
              mapId: "40140"
            )
    ]

    let purple =
    [
        stops(name: "Linden",
              type: .purple,
              mapId: "41050"
            ),
        stops(name: "Central",
              type: .purple,
              mapId: "41250"
            ),
        stops(name: "Noyes",
              type: .purple,
              mapId: "40400"
            )
        
    ]

    let pink =
    [
        stops(name: "54th/Cermak",
              type: .pink,
              mapId: "40580"
            ),
        stops(name: "Cicero/Cermak",
              type: .pink,
              mapId: "40420"
            ),
        stops(name: "Kostner",
              type: .pink,
              mapId: "40600"
            )
    ]

    let brown =
    [
        stops(name: "Kimball",
              type: .brown,
              mapId: "41290"
            ),
        stops(name: "Kedzie",
              type: .brown,
              mapId: "41180"
            ),
        stops(name: "Francisco",
              type: .brown,
              mapId: "40870"
            )
    ]

    let green =
    [
        stops(name: "Harlem",
              type: .green,
              mapId: "40020"
            ),
        stops(name: "Oak Park",
              type: .green,
              mapId: "41350"
            ),
        stops(name: "Ridgeland",
              type: .green,
              mapId: "40610"
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
