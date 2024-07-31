//
//  Reviews.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 10)
                        
                        Circle()
                            .fill(Color("prim").opacity(0.5))
                            .frame(width: 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 170, height: 52)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
            
        }
    }
}

#Preview {
    Reviews()
}
