//
//  TabBar.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .frame(width: 15, height: 15)

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 18)
        .padding(.bottom, 48)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("tbg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Events = "Events"
    
    case Participants = "Participants"
        
    case Settings = "Settings"
    
}
