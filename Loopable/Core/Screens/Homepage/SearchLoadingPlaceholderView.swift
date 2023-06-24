//
//  SearchLoadingPlaceholderView.swift
//  Loopable
//
//  Created by Mattia Cintura on 24/06/23.
//

import SwiftUI

struct SearchLoadingPlaceholderView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                // Container
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 280)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                
                // Container
                VStack(alignment: .leading, spacing: 3) {
                    Image("helmet_mock")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 170)
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                        .redacted(if: true)
                    
                    HStack {
                        Text("Casco da sci")
                            .font(.system(.title, design: .rounded, weight: .bold))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            .redacted(if: true)
                        Spacer()
                        Image(systemName: "heart")
                            .foregroundColor(.darkGrey50)
                            .padding(.trailing)
                            .redacted(if: true)
                    }
                    Text("Verbania (VB)")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.darkGrey25)
                        .padding(.leading)
                        .redacted(if: true)
                    Text("15€ al giorno")
                        .font(.system(.headline, design: .rounded, weight: .semibold))
                        .foregroundColor(.accentColor)
                        .padding(.leading)
                        .redacted(if: true)
                }
            }
            ProgressView()
        }
        .padding(.horizontal)
    }
}

struct SearchLoadingPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLoadingPlaceholderView()
    }
}
