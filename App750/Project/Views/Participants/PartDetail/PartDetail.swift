//
//  PartDetail.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct PartDetail: View {
    
    @StateObject var viewModel: ParticipantsViewModel
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
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Image(viewModel.selectedParticipant?.parPhoto ?? "")
                            .resizable()
                            .frame(width: 110, height: 170)
                            .padding(1)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Spacer()
                                
                                Text("Delete")
                                    .foregroundColor(.red)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                            .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text(viewModel.selectedParticipant?.parName ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                                .padding(1)
                            
                        }
                        
                        Text("Teams")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        HStack {
                            
                            VStack {
                                
                                Image(viewModel.selectedParticipant?.parTeam ?? "")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60)
                                
                                Text(viewModel.selectedParticipant?.parTeam ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 100)
                                    .lineLimit(1)
                                
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Date of birth")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text(viewModel.selectedParticipant?.parDate ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                                .padding(1)
                            
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Age")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text(viewModel.selectedParticipant?.parAge ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                                .padding(1)
                            
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("On-board number")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text(viewModel.selectedParticipant?.parNumber ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                                .padding(1)
                            
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deletePart(withParName: viewModel.selectedParticipant?.parName ?? "", completion: {
                            
                            viewModel.fetchParticipants()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("tbg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PartDetail(viewModel: ParticipantsViewModel())
}
