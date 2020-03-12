//
//  FoneticAlphabetModel.swift
//  FonetiskeAlfabet
//
//  Created by Søren Møller Gade Hansen on 17/08/2018.
//  Copyright © 2018 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

struct PhoneticCharacter {
    
    let character:String
    let fonetic:String
    
    static let foneticCharacters = [
        PhoneticCharacter(character: "A", fonetic: "alfa"),
        PhoneticCharacter(character: "B", fonetic: "bravo"),
        PhoneticCharacter(character: "C", fonetic: "charlie"),
        PhoneticCharacter(character: "D", fonetic: "delta"),
        PhoneticCharacter(character: "E", fonetic: "echo"),
        PhoneticCharacter(character: "F", fonetic: "foxtrot"),
        PhoneticCharacter(character: "G", fonetic: "golf"),
        PhoneticCharacter(character: "H", fonetic: "hotel"),
        PhoneticCharacter(character: "I", fonetic: "india"),
        PhoneticCharacter(character: "J", fonetic: "juliet"),
        PhoneticCharacter(character: "K", fonetic: "kilo"),
        PhoneticCharacter(character: "L", fonetic: "lima"),
        PhoneticCharacter(character: "M", fonetic: "mike"),
        PhoneticCharacter(character: "N", fonetic: "november"),
        PhoneticCharacter(character: "O", fonetic: "oscar"),
        PhoneticCharacter(character: "P", fonetic: "papa"),
        PhoneticCharacter(character: "Q", fonetic: "quebec"),
        PhoneticCharacter(character: "R", fonetic: "romeo"),
        PhoneticCharacter(character: "S", fonetic: "sierra"),
        PhoneticCharacter(character: "T", fonetic: "tango"),
        PhoneticCharacter(character: "U", fonetic: "uniform"),
        PhoneticCharacter(character: "V", fonetic: "victor"),
        PhoneticCharacter(character: "W", fonetic: "whiskey"),
        PhoneticCharacter(character: "X", fonetic: "x-ray"),
        PhoneticCharacter(character: "Y", fonetic: "yankee"),
        PhoneticCharacter(character: "Z", fonetic: "zulu"),
        PhoneticCharacter(character: "Æ", fonetic: "ægir"),
        PhoneticCharacter(character: "Ø", fonetic: "ødis"),
        PhoneticCharacter(character: "Å", fonetic: "åse")
    ]
    
}
