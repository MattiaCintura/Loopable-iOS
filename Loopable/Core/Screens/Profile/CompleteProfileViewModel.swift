//
//  CompleteProfileViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import Foundation

@MainActor
final class CompleteProfileViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}
