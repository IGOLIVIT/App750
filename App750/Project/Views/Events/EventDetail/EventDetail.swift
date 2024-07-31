//
//  EventDetail.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct EventDetail: View {

    @StateObject var viewModel: EventsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                    })
                    
                    Spacer()

                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 18) {
                        
                        Text(viewModel.selectedEvent?.evLoc ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                            .padding(.bottom)
                        
                        Text(viewModel.selectedEvent?.evDate ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(viewModel.selectedEvent?.evPhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                        
                        VStack(alignment: .leading) {
                            
                            Image(viewModel.selectedEvent?.evTeam ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            Text(viewModel.selectedEvent?.evTeam ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                                .lineLimit(1)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    EventDetail(viewModel: EventsViewModel())
}
