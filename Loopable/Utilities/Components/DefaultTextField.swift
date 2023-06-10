//
//  DefaultTextField.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/06/23.
//

import SwiftUI

struct DefaultTextField: View {
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
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField(name, text: value)
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.horizontal)
        }
    }
}

struct DefaultTextField_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTextField("CreateListing.Title", systemName: "character.cursor.ibeam", value: .constant(""))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
