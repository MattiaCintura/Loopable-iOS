//
//  ProductManager.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/06/23.
//

import Foundation

final class ProductManager {
    // TODO: Use dependency injection
    static let shared = ProductManager()
    
    private init() {}
    
    func getData() async -> [Product] {
        #if targetEnvironment(simulator)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let mockResult: [Product] = [
            .init(
                id: 1,
                name: "Mountain Bike",
                description: "Una mountain bike ad alte prestazioni per avventure fuoristrada.",
                owner: "Avventura Bici",
                price: 30.0,
                category: .outdoorActivities,
                images: ["mountain_bike_1.jpg", "mountain_bike_2.jpg"],
                createdAt: dateFormatter.date(from: "2023-07-01")!,
                updatedAt: dateFormatter.date(from: "2023-07-05")!
            ),
            .init(
                id: 2,
                name: "Tenda da campeggio",
                description: "Una tenda spaziosa per i tuoi viaggi di campeggio all'aperto.",
                owner: "Attrezzatura Outdoor",
                price: 20.0,
                category: .outdoorActivities,
                images: ["camping_tent_1.jpg", "camping_tent_2.jpg"],
                createdAt: dateFormatter.date(from: "2023-07-02")!,
                updatedAt: dateFormatter.date(from: "2023-07-07")!
            ),
            .init(
                id: 3,
                name: "Trapano a percussione",
                description: "Un trapano a percussione versatile per i tuoi progetti fai-da-te.",
                owner: "Maestri degli Strumenti",
                price: 15.0,
                category: .doItYourself,
                images: ["power_drill_1.jpg", "power_drill_2.jpg"],
                createdAt: dateFormatter.date(from: "2023-07-03")!,
                updatedAt: dateFormatter.date(from: "2023-07-08")!
            ),
            .init(
                id: 4,
                name: "Smartphone",
                description: "Lo smartphone più recente con funzionalità avanzate.",
                owner: "Tech Hub",
                price: 50.0,
                category: .technology,
                images: ["smartphone_1.jpg", "smartphone_2.jpg"],
                createdAt: dateFormatter.date(from: "2023-07-04")!,
                updatedAt: dateFormatter.date(from: "2023-07-09")!
            ),
            .init(
                id: 5,
                name: "Kayak",
                description: "Un kayak robusto per emozionanti avventure in acqua.",
                owner: "Mondo degli Sport Acquatici",
                price: 25.0,
                category: .outdoorActivities,
                images: ["kayak_1.jpg", "kayak_2.jpg"],
                createdAt: dateFormatter.date(from: "2023-07-05")!,
                updatedAt: dateFormatter.date(from: "2023-07-10")!
            )
        ]

        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)

        return mockResult
        #else
        return []
        #endif
    }
}
