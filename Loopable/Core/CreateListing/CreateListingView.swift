//
//  CreateListingView.swift
//  Loopable
//
//  Created by Mattia Cintura on 27/04/23.
//

import SwiftUI

struct CreateListingView: View {
    @State private var progress: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    FormStepper(progress: progress)
                    switch progress {
                    case 0:
                        FisrtStep
                    case 1:
                        SecondStep
                    case 2:
                        ThridStep
                    default:
                        EmptyView()
                    }
                    Spacer()
                    ButtonsRow
                        .padding(.bottom)
                }
            }
            .navigationTitle("CreateListingView.NavigationTitle")
            .navigationBarTitleDesign(.darkGrey, rounded: true)
        }
    }
}

struct CreateListingView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListingView()
    }
}

extension CreateListingView {
    private var FisrtStep: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "character.cursor.ibeam")
                    Text("CreateListingView.Title")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListingView.Title", text: .constant(""))
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "text.justify.leading")
                    Text("CreateListingView.Description")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 150)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListingView.Description", text: .constant(""), axis: .vertical)
                        .lineLimit(6, reservesSpace: true)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "location.circle.fill")
                    Text("CreateListingView.Location")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListingView.Location", text: .constant(""))
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "eurosign.circle.fill")
                    Text("CreateListingView.Price")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 210, height: 50)
                            .foregroundColor(.white)
                            .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                        Image(systemName: "eurosign")
                            .padding(.trailing)
                            .foregroundColor(.darkGrey)
                    }
                    TextField("CreateListingView.Price.Placeholder", value: .constant(""), formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
        }
    }

    private var SecondStep: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("CreateListingView.Photos")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                        Image(systemName: "plus.circle.fill")
                            .padding(.trailing)
                            .foregroundColor(.darkGrey)
                    }
                    Text("CreateListingView.Photos.Placeholder")
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "tag")
                    Text("CreateListingView.Category")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                        Image(systemName: "chevron.up.chevron.down")
                            .padding(.trailing)
                            .foregroundColor(.darkGrey)
                    }
                    Text("CreateListingView.Category.Placeholder")
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "calendar")
                    Text("CreateListingView.PurchaseYear")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListingView.PurchaseYear", value: .constant(""), formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "sparkles")
                    Text("CreateListingView.Condition")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                        Image(systemName: "chevron.up.chevron.down")
                            .padding(.trailing)
                            .foregroundColor(.darkGrey)
                    }
                    Text("CreateListingView.Condition.Placeholder")
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var ThridStep: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "calendar")
                    Text("CreateListingView.Available")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
    
                    DatePicker("CreateListingView.Available.Placeholder", selection: .constant(Date()), displayedComponents: [.date])
                        .padding(.horizontal)
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "phone")
                    Text("CreateListingView.PhoneNumber")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListingView.PhoneNumber", value: .constant(""), formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var ButtonsRow: some View {
        VStack {
            if progress > 0 {
                Button {
                    progress -= 1
                } label: {
                    Text("Shared.GoBack")
                        .font(.system(.footnote, design: .rounded))
                        .underline()
                        .foregroundColor(.lightGrey)
                }
            }
            Button {
                if progress < 2 {
                    progress += 1
                }
            } label: {
                Text(progress == 2 ? "CreateListingView.Publish" : "Shared.Next")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 55)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
    }
}
