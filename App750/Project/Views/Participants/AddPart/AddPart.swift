//
//  AddPart.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct AddPart: View {

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

                        viewModel.parPhoto = viewModel.currMen
                        viewModel.parTeam = viewModel.curTPhoto
                        
                        viewModel.addParticipant()
                        
                        viewModel.parName = ""
                        viewModel.parDate = ""
                        viewModel.parAge = ""
                        viewModel.parNumber = ""
                        
                        viewModel.fetchParticipants()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.currMen.isEmpty || viewModel.curTPhoto.isEmpty || viewModel.parName.isEmpty || viewModel.parDate.isEmpty || viewModel.parAge.isEmpty || viewModel.parNumber.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currMen.isEmpty || viewModel.curTPhoto.isEmpty || viewModel.parName.isEmpty || viewModel.parDate.isEmpty || viewModel.parAge.isEmpty || viewModel.parNumber.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.mens, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currMen = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currMen.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 29, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currMen)
                                    .resizable()
                                    .frame(width: 110, height: 170)
                                    .padding(1)
                            }
                            
                        })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.parName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.parName)
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
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Date of birth")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.parDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.parDate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                            .padding(1)
                            
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Age")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.parAge.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.parAge)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                            .padding(1)
                            
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("On-board number")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.parNumber.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.parNumber)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.4)))
                            .padding(1)
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPart(viewModel: ParticipantsViewModel())
}
