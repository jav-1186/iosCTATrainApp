//
//  trainLines.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/18/21.
//

import Foundation

// Array of the train lines
let trainLines =
    [
        train(name: "Blue",
              type: .blue
            ),
        train(name: "Red",
              type: .red
            ),
        train(name: "Yellow",
              type: .yellow
            ),
        train(name: "Brown",
              type: .brown
            ),
        train(name: "Green",
              type: .green
            ),
        train(name: "Orange",
              type: .orange
            ),
        train(name: "Pink",
              type: .pink
            ),
        train(name: "Purple",
              type: .purple
            )
    ]

// Train class
class train
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
    
    init(name: String, type: Type)
    {
        self.name = name
        self.type = type
    }
    
}
