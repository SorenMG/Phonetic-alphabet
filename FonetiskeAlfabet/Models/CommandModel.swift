//
//  CommandModel.swift
//  FonetiskeAlfabet
//
//  Created by Søren Møller Gade Hansen on 07/09/2018.
//  Copyright © 2018 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

struct Command {
    
    let fullName: String
    let shoutout: String
    let letterList: [Letters]
    
    static let commands = [
        Command(fullName: "FALKUSE", shoutout: "Klar til kamp", letterList: [Letters(letter: "F", meaning: "Funktionering"), Letters(letter: "A", meaning: "Ammunition"), Letters(letter: "L", meaning: "Ladning"), Letters(letter: "K", meaning: "Kampviser"), Letters(letter: "U", meaning: "Udrustning"), Letters(letter: "S", meaning: "Sløring"), Letters(letter: "E", meaning: "Ekstra udrustning")]),
        Command(fullName: "FSDOT", shoutout: "Perfekt skydestilling", letterList: [Letters(letter: "F", meaning: "Frit skud"), Letters(letter: "S", meaning: "Sløring"), Letters(letter: "D", meaning: "Dækning"), Letters(letter: "O", meaning: "Observation"), Letters(letter: "T", meaning: "Afgangsveje")]),
        Command(fullName: "AMAIFOKI", shoutout: "Klar til ildoverfald", letterList: [Letters(letter: "A", meaning: "Avertissement"), Letters(letter: "M", meaning: "Mål"), Letters(letter: "A", meaning: "Afstand"), Letters(letter: "I", meaning: "Ildfordeling"), Letters(letter: "FO", meaning: "Formation"), Letters(letter: "K", meaning: "Klarmelding"), Letters(letter: "I", meaning: "Iværksættelse")]),
        Command(fullName: "De 4'ere B'er", shoutout: "Sløring af stilling", letterList: [Letters(letter: "B", meaning: "Bevoksning"), Letters(letter: "B", meaning: "Belysning"), Letters(letter: "B", meaning: "Baggrund"), Letters(letter: "B", meaning: "Bevægelse")]),
        Command(fullName: "VAMUK", shoutout: "Genordning", letterList: [Letters(letter: "V", meaning: "Våben"), Letters(letter: "A", meaning: "Ammunition"), Letters(letter: "M", meaning: "Manden"), Letters(letter: "U", meaning: "Udrustning"), Letters(letter: "K", meaning: "Klarmelding")]),
        Command(fullName: "KANÆFOSKI", shoutout: "Stillingsskifte", letterList: [Letters(letter: "K", meaning: "Kommand til ildens ophør"), Letters(letter: "A", meaning: "Avertissement"), Letters(letter: "NÆ", meaning: "Næste stilling"), Letters(letter: "FO", meaning: "Formation"), Letters(letter: "S", meaning: "Støtte"), Letters(letter: "K", meaning: "Klarmelding"), Letters(letter: "I", meaning: "Iværksættelse")])
        // BASKON
    ]
}

struct Letters {
    
    let letter: String
    let meaning: String
    
}
