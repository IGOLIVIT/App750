//
//  R2.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Convenient functionality and ease of learning")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("prim").opacity(0.5))
                            .frame(width: 8)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 8)

                        Spacer()
                        
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 170, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
