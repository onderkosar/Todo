//
//  EmptyListView.swift
//  Todo
//
//  Created by Önder Koşar on 18.10.2020.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image("\(images.randomElement() ?? images[0])")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                Text("\(tips.randomElement() ?? tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
            } //: VSTACK
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5))
            .onAppear(perform: {
                self.isAnimated.toggle()
            })
        } //: ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .dark)
    }
}
