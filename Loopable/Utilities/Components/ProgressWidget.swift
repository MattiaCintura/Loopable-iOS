//
//  ProgressWidget.swift
//  Loopable
//
//  Created by Mattia Cintura on 27/04/23.
//

import SwiftUI

struct ProgressWidget: View {
    @Binding var showProgressWidget: Bool
    @State private var progress: Int = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 160)
                .foregroundColor(Color.accentColor.opacity(0.10))
            
            switch progress {
            case 0:
                FirstStep
            case 1:
                SecondStep
            case 2:
                ThirdStep
            case 3:
                ForthStep
            case 4:
                FifthStep
            default:
                Text("")
            }
        }
        .padding([.horizontal, .bottom])
        .onTapGesture {
            if progress < 4 {
                progress += 1
            }
        }
    }
}

struct ProgressWidget_Previews: PreviewProvider {
    static var previews: some View {
        ProgressWidget(showProgressWidget: .constant(true))
    }
}

extension ProgressWidget {
    private var FirstStep: some View {
        VStack(alignment: .leading, spacing: 25) {
            Group {
                Text("Consegna - ")
                    .foregroundColor(.darkGrey) +
                Text("Casco da sci")
                    .foregroundColor(.accentColor)
            }
            .font(.system(.title, design: .rounded, weight: .bold))
            HStack(spacing: 10) {
                Label("Domani", systemImage: "clock")
                Label("User123", systemImage: "person")
            }
            .font(.system(.footnote, design: .rounded, weight: .medium))
            .foregroundColor(.darkGrey)
            HStack {
                Capsule()
                    .frame(width: 105, height: 10)
                Capsule()
                    .frame(width: 105, height: 10)
                Capsule()
                    .frame(width: 105, height: 10)
            }
            .foregroundColor(Color.accentColor.opacity(0.15))
        }
    }
    
    private var SecondStep: some View {
        VStack(alignment: .leading, spacing: 18) {
            Group {
                Text("Consegna - ")
                    .foregroundColor(.darkGrey) +
                Text("Casco da sci")
                    .foregroundColor(.accentColor)
            }
            .font(.system(.title, design: .rounded, weight: .bold))
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Label("Conferma consegna", systemImage: "checkmark.circle")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                
                Label("Oggi", systemImage: "clock")
                Label("User123", systemImage: "person")
            }
            .font(.system(.footnote, design: .rounded, weight: .medium))
            .foregroundColor(.darkGrey)
            HStack {
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 105, height: 10)
                        .foregroundColor(Color.accentColor.opacity(0.15))
                    Capsule()
                        .frame(width: 52.5, height: 10)
                        .foregroundColor(.accentColor)
                }
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(Color.accentColor.opacity(0.15))
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(Color.accentColor.opacity(0.15))
            }
        }
    }
    
    private var ThirdStep: some View {
        VStack(alignment: .leading, spacing: 18) {
            Group {
                Text("Noleggiato - ")
                    .foregroundColor(.darkGrey) +
                Text("Casco da sci")
                    .foregroundColor(.accentColor)
            }
            .font(.system(.title, design: .rounded, weight: .bold))
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Label("Contatta User123", systemImage: "bubble.left.and.bubble.right")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
            }
            .font(.system(.footnote, design: .rounded, weight: .medium))
            .foregroundColor(.darkGrey)
            HStack {
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(Color.accentColor.opacity(0.15))
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(Color.accentColor.opacity(0.15))
            }
        }
    }
    
    private var ForthStep: some View {
        VStack(alignment: .leading, spacing: 18) {
            Group {
                Text("Ritira - ")
                    .foregroundColor(.darkGrey) +
                Text("Casco da sci")
                    .foregroundColor(.accentColor)
            }
            .font(.system(.title, design: .rounded, weight: .bold))
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Label("Conferma ritiro", systemImage: "checkmark.circle")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left.and.bubble.right")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.accentColor)
                .tint(.white)
            }
            .font(.system(.footnote, design: .rounded, weight: .medium))
            .foregroundColor(.darkGrey)
            HStack {
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(Color.accentColor.opacity(0.15))
            }
        }
    }
    
    private var FifthStep: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Finito!")
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundColor(.darkGrey)
            HStack(spacing: 10) {
                Button("Chiudi") {
                    showProgressWidget = false
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                Button {
                    progress = 0
                } label: {
                    Label("Segnala un problema", systemImage: "exclamationmark.bubble")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .foregroundColor(.accentColor)
                .tint(.white)
            }
            .font(.system(.footnote, design: .rounded, weight: .medium))
            .foregroundColor(.darkGrey)
            HStack {
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
                Capsule()
                    .frame(width: 105, height: 10)
                    .foregroundColor(.accentColor)
            }
        }
    }
}