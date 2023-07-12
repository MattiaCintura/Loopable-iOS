//
//  HomepageScreen.swift
//  Loopable
//
//  Created by Mattia Cintura on 24/06/23.
//

import SwiftUI

struct HomepageScreen: View {
    @StateObject private var vm = HomepageScreenViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                SearchField
                
                switch vm.displayMode {
                case .normal:
                    HomepageView()
                        .transition(.opacity)
                case .loading:
                    SearchLoadingPlaceholderView()
                        .transition(.opacity)
                case .result:
                    SearchResultView(resultList: vm.resultList)
                        .transition(.opacity)
                case .noData:
                    NoDataPlaceholderView(searchQuery: vm.searchQuery)
                        .transition(.opacity)
                }
            }
            .background(
                Color.globalBackground
                    .ignoresSafeArea()
            )
            .navigationBarTitleDisplayMode(.inline)
            .scrollDismissesKeyboard(.immediately)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Loopable_Green_Logo_Full")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct HomepageScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomepageScreen()
    }
}

extension HomepageScreen {
    private var SearchField: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.darkGrey)
                    
                    TextField("Homepage.SearchFieldPlaceholder", text: $vm.searchQuery)
                        .submitLabel(.search)
                        .onSubmit {
                            Task {
                                await vm.filterListBySearchQuery() 
                            }
                        }
                    
                    Spacer()

                    if !vm.searchQuery.isEmpty {
                        Button {
                            vm.cancelSearch()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.darkGrey)
                        }
                    }
                }
                .padding()
            }
            
            if !(vm.displayMode == .normal) {
                HStack {
                    Menu {
                        ForEach(ProvinceOfItaly.allCases, id: \.self) { item in
                            Button(item.rawValue) {
                                vm.filterArea = item.rawValue
                            }
                        }
                    } label: {
                        Label {
                            Text("SearchResult.Location \(vm.filterArea ?? ProvinceOfItaly.milano.rawValue)")
                                .foregroundColor(.darkGrey)
                        } icon: {
                            Image(systemName: "location.circle.fill")
                                .foregroundColor(.accentColor)
                        }
                        .font(.system(.subheadline, design: .rounded, weight: .bold))
                    }

                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
