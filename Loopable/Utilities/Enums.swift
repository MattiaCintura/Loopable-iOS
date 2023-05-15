//
//  Enums.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import Foundation

// MARK: Firebase utilities
enum FirestoreCollection: String {
    case users
}

// MARK: Authentication
enum AuthProviderOprion: String {
    case password = "password"
    case apple = "apple.com"
}

// MARK: User
enum ProvinceOfItaly: String {
    case agrigento
    case alessandria
    case ancona
    case aosta
    case arezzo
    case ascoliPiceno
    case asti
    case avellino
    case Bari
    case BarlettaAndriaTrani
    case Belluno
    case Benevento
    case Bergamo
    case Biella
    case Bologna
    case Bolzano
    case Brescia
    case Brindisi
    case cagliari
    case caltanissetta
    case campobasso
    case carboniaIglesias
    case caserta
    case catania
    case catanzaro
    case chieti
    case como
    case cosenza
    case cremona
    case crotone
    case cuneo
    case enna
    case fermo
    case ferrara
    case firenze
    case foggia
    case forlìCesena
    case frosinone
    case genova
    case gorizia
    case grosseto
    case imperia
    case isernia
    case laSpezia
    case lAquila
    case latina
    case lecce
    case lecco
    case livorno
    case lodi
    case lucca
    case macerata
    case mantova
    case massaCarrara
    case matera
    case messina
    case milano
    case MedioCampidano
    case modena
    case monzaBrianza
    case napoli
    case novara
    case nuoro
    case ogliastra
    case olbiaTempio
    case oristano
    case padova
    case palermo
    case parma
    case pavia
    case perugia
    case pesaroUrbino
    case pescara
    case piacenza
    case pisa
    case pistoia
    case pordenone
    case potenza
    case prato
    case ragusa
    case ravenna
    case reggioCalabria
    case reggioEmilia
    case rieti
    case rimini
    case roma
    case rovigo
    case salerno
    case sassari
    case savona
    case siena
    case siracusa
    case sondrio
    case taranto
    case teramo
    case terni
    case torino
    case trapani
    case trento
    case treviso
    case trieste
    case udine
    case varese
    case venezia
    case verbanoCusioOssola
    case vercelli
    case verona
    case viboValentia
    case vicenza
    case viterbo
}

// MARK: Error
enum AuthenticationError: Error {
    case requiredEmail
    case requiredPassword
    case requiredEmailAndPassword
    case invalidEmail
    case weakPassword
    case confirmPassword
    case unableToSignInWithApple
}
