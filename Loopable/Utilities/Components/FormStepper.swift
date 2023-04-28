//
//  FormStepper.swift
//  Loopable
//
//  Created by Mattia Cintura on 28/04/23.
//

import SwiftUI

struct FormStepper: View {
    var progress: Int
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .frame(width: 200, height: 7)
                
                    switch progress {
                    case 0:
                        FirstStep
                    case 1:
                        SecondStep
                    case 2:
                        ThirdStep
                    case 3:
                        FinalStep
                    default:
                        EmptyView()
                    }
            }
            .foregroundColor(.lightGrey)
        }
    }
}

struct FormStepper_Previews: PreviewProvider {
    static var previews: some View {
        FormStepper(progress: 0)
    }
}

extension FormStepper {
    private var FirstStep: some View {
        HStack(spacing: 70) {
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "1.circle.fill")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "2.circle")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "3.circle")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
        }
    }

    private var SecondStep: some View {
        HStack(spacing: 70) {
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "2.circle.fill")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "3.circle")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
        }
    }
    
    private var ThirdStep: some View {
        HStack(spacing: 70) {
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "3.circle.fill")
                    .foregroundColor(.darkGrey)
                    .font(.footnote)
            }
        }
    }
    
    private var FinalStep: some View {
        HStack(spacing: 70) {
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
            ZStack {
                Circle()
                    .frame(width: 20)
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            }
        }
    }
}
