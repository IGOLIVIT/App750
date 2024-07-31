//
//  AddEvent.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct AddEvent: View {
    
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
                    
                    Button(action: {
                        
                        viewModel.entries += 1

                        viewModel.evPhoto = viewModel.currTrack
                        viewModel.evTeam = viewModel.curTPhoto
                        
                        viewModel.addEvent()
                        
                        viewModel.evLoc = ""
                        viewModel.evDate = ""
                        viewModel.curTPhoto = ""
                        viewModel.currTrack = ""
                        
                        viewModel.fetchEvents()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.currTrack.isEmpty || viewModel.curTPhoto.isEmpty || viewModel.evLoc.isEmpty || viewModel.evDate.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currTrack.isEmpty || viewModel.curTPhoto.isEmpty || viewModel.evLoc.isEmpty || viewModel.evDate.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.tracks, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currTrack = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currTrack.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 29, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currTrack)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .padding(1)
                            }
                            
                        })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Location")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.evLoc.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evLoc)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evDate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                            .padding(1)
                            
                        }
                        
                        Text("Teams")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        HStack {
                            
                            ForEach(viewModel.teamsPhoto, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curTPhoto = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            Image(index)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60)
                                                .padding(2)
                                                .background(Circle().fill(Color("prim").opacity(viewModel.curTPhoto == index ? 1 : 0)))
                                            
                                            Text(index)
                                                .foregroundColor(viewModel.curTPhoto == index ? Color("prim") : .white)
                                                .font(.system(size: 12, weight: .regular))
                                                .frame(width: 100)
                                                .lineLimit(1)
                                            
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddEvent(viewModel: EventsViewModel())
}
