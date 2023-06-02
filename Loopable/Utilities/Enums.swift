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
    case productListing = "product_listing"
}

// MARK: Shared
enum ProvinceOfItaly: String, CaseIterable, Codable {
    case agrigento = "Agrigento"
    case alessandria = "Alessandria"
    case ancona = "Ancona"
    case aosta = "Aosta"
    case arezzo = "Arezzo"
    case ascoliPiceno = "Ascoli Piceno"
    case asti = "Asti"
    case avellino = "Avellino"
    case bari = "Bari"
    case barlettaAndriaTrani = "Barletta Andria Trani"
    case belluno = "Belluno"
    case benevento = "Benevento"
    case bergamo = "Bergamo"
    case biella = "Biella"
    case bologna = "Bologna"
    case bolzano = "Bolzano"
    case brescia = "Brescia"
    case brindisi = "Brindisi"
    case cagliari = "Cagliari"
    case caltanissetta = "Caltanissetta"
    case campobasso = "Campobasso"
    case carboniaIglesias = "Carbonia Iglesias"
    case caserta = "Caserta"
    case catania = "Catania"
    case catanzaro = "Catanzaro"
    case chieti = "Chieti"
    case como = "Como"
    case cosenza = "Cosenza"
    case cremona = "Cremona"
    case crotone = "Crotone"
    case cuneo = "Cuneo"
    case enna = "Enna"
    case fermo = "Fermo"
    case ferrara = "Ferrara"
    case firenze = "Firenze"
    case foggia = "Foggia"
    case forlìCesena = "Forlì Cesena"
    case frosinone = "Frosinone"
    case genova = "Genova"
    case gorizia = "Gorizia"
    case grosseto = "Grosseto"
    case imperia = "Imperia"
    case isernia = "Isernia"
    case laSpezia = "La Spezia"
    case lAquila = "L'Aquila"
    case latina = "Latina"
    case lecce = "Lecce"
    case lecco = "Lecco"
    case livorno = "Livorno"
    case lodi = "Lodi"
    case lucca = "Lucca"
    case macerata = "Macerata"
    case mantova = "Mantova"
    case massaCarrara = "Massa Carrara"
    case matera = "Matera"
    case messina = "Messina"
    case milano = "Milano"
    case medioCampidano = "Medio Campidano"
    case modena = "Modena"
    case monzaBrianza = "Monza Brianza"
    case napoli = "Napoli"
    case novara = "Novara"
    case nuoro = "Nuoro"
    case ogliastra = "Ogliastra"
    case olbiaTempio = "Olbia Tempio"
    case oristano = "Oristano"
    case padova = "Padova"
    case palermo = "Palermo"
    case parma = "Parma"
    case pavia = "Pavia"
    case perugia = "Perugia"
    case pesaroUrbino = "Pesaro Urbino"
    case pescara = "Pescara"
    case piacenza = "Piacenza"
    case pisa = "Pisa"
    case pistoia = "Pistoia"
    case pordenone = "Pordenone"
    case potenza = "Potenza"
    case prato = "Prato"
    case ragusa = "Ragusa"
    case ravenna = "Ravenna"
    case reggioCalabria = "Reggio Calabria"
    case reggioEmilia = "Reggio Emilia"
    case rieti = "Rieti"
    case rimini = "Rimini"
    case roma = "Roma"
    case rovigo = "Rovigo"
    case salerno = "Salerno"
    case sassari = "Sassari"
    case savona = "Savona"
    case siena = "Siena"
    case siracusa = "Siracusa"
    case sondrio = "Sondrio"
    case taranto = "Taranto"
    case teramo = "Teramo"
    case terni = "Terni"
    case torino = "Torino"
    case trapani = "Trapani"
    case trento = "Trento"
    case treviso = "Treviso"
    case trieste = "Trieste"
    case udine = "Udine"
    case varese = "Varese"
    case venezia = "Venezia"
    case verbanoCusioOssola = "Verbano Cusio Ossola"
    case vercelli = "Vercelli"
    case verona = "Verona"
    case viboValentia = "Vibo Valentia"
    case vicenza = "Vicenza"
    case viterbo = "Viterbo"
}

// MARK: Authentication
enum AuthProviderOprion: String {
    case password = "password"
    case apple = "apple.com"
}

// MARK: Product Listing
enum ProductCategory: String, CaseIterable, Codable {
    case outdoorActivities
    case doItYourself
    case technology
    case other
}

enum ProductCondition: String, CaseIterable, Codable {
    case new
    case excellent
    case good
    case damaged
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
