//
//  ContentView.swift
//  Gatis Shop
//
//  Created by Roberto Seittiffe on 03-02-21.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            
            Home()
            
            ZStack{
                Color("launchScreenBackground")
                Image("AppLaunchScreen")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 250, height: animate ? nil : 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                // sacling View
                    .scaleEffect(animate ? 3 : 1)
                //setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateLaunchScreen)
            //hidding view after finishing
            .opacity(endSplash ?  0 : 1)
        }
    }
    
    func animateLaunchScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            withAnimation(Animation.easeOut(duration: 0.45)){
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.35)){
                endSplash.toggle()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    var body: some View {
        VStack {
            HStack{
                Text("Gatis Shop")
                    .font(.largeTitle)
                    .font(Font.custom("Baskerville", size: 33))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            
            Spacer()
            
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
    
}
