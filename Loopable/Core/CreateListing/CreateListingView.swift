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
            .navigationTitle("Crea Annuncio")
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
                    Text("Titolo")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Titolo", text: .constant(""))
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "text.justify.leading")
                    Text("Descrizione")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 150)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Descrizione", text: .constant(""), axis: .vertical)
                        .lineLimit(6, reservesSpace: true)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "location.circle.fill")
                    Text("Provincia di interesse")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Provincia di interesse", text: .constant(""))
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "eurosign.circle.fill")
                    Text("Prezzo")
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
                    TextField("Prezzo per giornata", value: .constant(""), formatter: NumberFormatter())
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
                    Text("Foto")
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
                    Text("Scegli almeno due foto")
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "tag")
                    Text("Categoria")
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
                    Text("Scegli una categoria")
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "calendar")
                    Text("Anno di acquisto")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Anno di acquisto", value: .constant(""), formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "sparkles")
                    Text("Condizioni")
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
                    Text("Scegli condizioni")
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
                    Text("Disponibilità")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
    
                    DatePicker("Disponibile dal giorno", selection: .constant(Date()), displayedComponents: [.date])
                        .padding(.horizontal)
                        .foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Image(systemName: "phone")
                    Text("Numero di telefono")
                }
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.darkGrey)
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Numero di telefono", value: .constant(""), formatter: NumberFormatter())
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
                    Text("Torna indietro")
                        .font(.system(.footnote, design: .rounded))
                        .underline()
                        .foregroundColor(.lightGrey)
                }
            }
            Button {
                progress += 1
            } label: {
                Text(progress == 2 ? "Pubblica annuncio" : "Avanti")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 55)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
    }
}
