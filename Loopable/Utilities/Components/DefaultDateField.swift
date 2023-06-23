//
//  DefaultDateField.swift
//  Loopable
//
//  Created by Mattia Cintura on 03/06/23.
//

import SwiftUI

struct DefaultDateField: View {
    var name: LocalizedStringKey
    var placeholder: LocalizedStringKey
    var systemImage: String
    var value: Binding<Date>
    var range: PartialRangeFrom<Date>
    
    init(_ name: LocalizedStringKey, placeholder: LocalizedStringKey, systemImage: String, value: Binding<Date>, range: PartialRangeFrom<Date>) {
        self.name = name
        self.placeholder = placeholder
        self.systemImage = systemImage
        self.value = value
        self.range = range
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: systemImage)
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

                DatePicker(placeholder, selection: value, in: range,displayedComponents: [.date])
                    .padding(.horizontal)
                    .foregroundColor(.gray.opacity(0.5))
            }
            .padding(.horizontal)
        }
    }
}

struct DefaultDateField_Previews: PreviewProvider {
    static var previews: some View {
        DefaultDateField(
            "CreateListing.Available",
            placeholder: "CreateListing.Available.Placeholder",
            systemImage: "calendar",
            value: .constant(Date()),
            range: Date()...
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
    }
}
