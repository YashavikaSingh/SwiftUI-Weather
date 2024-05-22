//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Yashavika Singh on 22.05.24.
//

import SwiftUI
import CoreData

struct ContentView: View {


    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .white]) , startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Cupertino, CA ")
                    .font(.system(size: 32, weight: .medium, design: .default ))
                    .foregroundColor(.white)
                    .padding()
                
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                }
                
                Spacer()
            }
        }
    }

  

   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
