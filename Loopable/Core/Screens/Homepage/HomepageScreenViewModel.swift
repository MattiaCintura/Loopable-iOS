//
//  HomepageScreenViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 28/06/23.
//

import Foundation

@MainActor
final class HomepageScreenViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var resultList: Array<Product> = []
    
    @Published var isSearching = false
    @Published var isLoading = false
    @Published var filterArea: String?
    
    var displayMode: HomepageState {
        if isSearching == true && isLoading == false && resultList.count >= 1 {
            return .result
        } else if isSearching == true && isLoading == true && resultList.isEmpty {
            return .loading
        } else if isSearching == true && isLoading == false && resultList.isEmpty {
            return .noData
        } else {
            return .normal
        }
    }
    
    init() { }
    
    func filterListBySearchQuery() async -> Void {
        guard !searchQuery.isEmpty else { return }
        
        self.isSearching = true
        self.isLoading = true

        self.resultList = await ProductManager.shared.getData()
        
        self.isLoading = false
    }
    
    func filterListByLocation() async -> Void {
        
    }
    
    func cancelSearch() -> Void {
        self.searchQuery = ""
        self.isSearching = false
        self.resultList = []
    }
}
