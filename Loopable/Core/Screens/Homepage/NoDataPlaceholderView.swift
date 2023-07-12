//
//  NoDataPlaceholderView.swift
//  Loopable
//
//  Created by Mattia Cintura on 25/06/23.
//

import SwiftUI

struct NoDataPlaceholderView: View {
    var searchQuery: String

    var body: some View {
        VStack {
            Image("No_data_placeholder")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("Homepage.NoData")
                .foregroundColor(.darkGrey)
                .font(.system(.body, design: .rounded))
        }
    }
}

struct NoDataPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataPlaceholderView(searchQuery: "Test")
    }
}
