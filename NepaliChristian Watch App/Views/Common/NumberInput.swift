//
//  NumberInput.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 11/07/2024.
//

import SwiftUI

struct NumberInput: View {
    @Environment(\.dismiss) var dismiss
    @State var value = ""
    
    var onSubmit: (_ value: String) -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 2) {
                HStack {
                    Text(value)
                        .fontWeight(.bold)
                }
                .frame(height: 24)
                .padding(.bottom)
                
                ForEach(0...2, id: \.self) { row in
                    HStack(spacing: 2) {
                        ForEach(1...3, id: \.self) {
                            column in
                            
                            Button {
                                value += "\(3 * row + column)"
                                
                            } label: {
                                Text("\(3 * row + column)")
                            }
                        }
                        .controlSize(.mini)
                    }
                }
                HStack(spacing: 2) {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "clear")
                    }
                    
                    Button {
                        value += "0"
                    } label: {
                        Text("0")
                    }
                    
                    Button(action: {
                        value = String(value.dropLast())
                    }, label: {
                        Image(systemName: "delete.left")
                    })
                }
                .controlSize(.mini)
            }
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Go") {
                    onSubmit(value)
                }
                
            }
        }
    }
}

#Preview {
    @State var sheet = true
    return
        Text("Test")
            .sheet(isPresented: $sheet) {
                NumberInput(onSubmit: { value in
                    print(value)
                })
            }
}
