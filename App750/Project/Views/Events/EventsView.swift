//
//  EventsView.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar of events")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    Image("i1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("\(Text("\(viewModel.entries)").foregroundColor(.blue).font(.system(size: 22, weight: .bold))) entries added")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                    
                    Image("i1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                        .padding(.horizontal)

                }
                .padding(9)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                
                HStack {
                    
                    Text("Events")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    })
                }
                .padding(.vertical)

                if viewModel.events.isEmpty {
                    
                    VStack {
                        
                        Image("rocket")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)

                        Text("You haven't added any entries")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                    
                    Spacer()
                    
                } else {
                        
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(viewModel.events, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedEvent = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    HStack {
                                        
                                        Text("Location")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Text(index.evLoc ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.evDate ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Image(index.evTeam ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 45)
                                    }
                                    
                                    Image(index.evPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            })
                        }
                    }
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEvent(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EventDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    EventsView()
}
