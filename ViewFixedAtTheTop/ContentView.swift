//
//  ContentView.swift
//  ViewFixedAtTheTop
//
//  Created by Shigenari Oshio on 2022/11/24.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        NavigationView {
            GeometryReader { scrollViewGeo in
                ScrollView {
                    Text("Some Content")
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .background(.cyan)
                    
                    VStack {
                        GeometryReader { fixedViewGeo in
                            Text("Fixed View")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.green)
                                .offset(
                                    y: {
                                        let distanceToTheTop = fixedViewGeo.frame(in: .global).minY - scrollViewGeo.frame(in: .global).minY
                                        return distanceToTheTop < 0 ? -distanceToTheTop : 0
                                    }()
                                )
                        }
                        .frame(height: 100)
                        .zIndex(1)
                        
                        VStack(spacing: 0) {
                            ForEach(0..<10) { i in
                                Text("Some Long Content")
                                    .frame(height: 100)
                                    .frame(maxWidth: .infinity)
                                    .background(.yellow)
                            }
                        }
                    }
                }
                .navigationTitle("Title")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
