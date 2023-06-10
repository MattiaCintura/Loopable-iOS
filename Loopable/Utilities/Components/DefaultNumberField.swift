//
//  DefaultNumberField.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/06/23.
//

import SwiftUI

struct DefaultNumberField: View {
    var name: LocalizedStringKey
    var systemName: String
    var value: Binding<String>
    
    init(_ name: LocalizedStringKey, systemName: String, value: Binding<String>) {
        self.name = name
        self.systemName = systemName
        self.value = value
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: systemName)
                Text(name)
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField(name, value: value, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.horizontal)
        }
    }
}

struct DefaultNumberField_Previews: PreviewProvider {
    static var previews: some View {
        DefaultNumberField("CreateListing.PurchaseYear", systemName: "calendar", value: .constant(""))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
