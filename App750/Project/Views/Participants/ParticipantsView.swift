//
//  ParticipantsView.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct ParticipantsView: View {

    @StateObject var viewModel = ParticipantsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Participants and teams")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
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
                                        .frame(width: 50)
                                        .padding(2)
                                        .background(Circle().fill(Color("prim").opacity(viewModel.curTPhoto == index ? 1 : 0)))
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.curTPhoto == index ? Color("prim") : .white)
                                        .font(.system(size: 11, weight: .regular))
                                        .frame(width: 100)
                                        .lineLimit(1)
                                    
                                }
                            }
                        })
                    }
                    
                    Spacer()
                }
                
                HStack {
                    
                    Text("Participants")
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
                
                if viewModel.participants.isEmpty {
                    
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
                        
                        ForEach(viewModel.participants, id: \.self) { index in
                            
                            LazyVStack {
                                
                                Button(action: {
                                    
                                    viewModel.selectedParticipant = index
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.parPhoto ?? "")
                                            .resizable()
                                            .frame(maxHeight: .infinity)
                                            .frame(width: 130)
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(index.parName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26, weight: .medium))
                                            
                                            HStack {
                                                
                                                Image(index.parTeam ?? "")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40)
                                                
                                                Text(index.parTeam ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                
                                                Text("Date of birth")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Spacer()
                                                
                                                Text(index.parDate ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 18, weight: .medium))
                                            }
                                            
                                            HStack {
                                                
                                                Text("Age")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Spacer()
                                                
                                                Text(index.parAge ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 18, weight: .medium))
                                            }
                                            
                                            HStack {
                                                
                                                Text("On-board number")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Spacer()
                                                
                                                Text(index.parNumber ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 18, weight: .medium))
                                            }
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                    }
                                    .cornerRadius(25)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPart(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PartDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    ParticipantsView()
}
