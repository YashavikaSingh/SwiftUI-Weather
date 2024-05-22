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
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]) , startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Brooklyn, NY")
                    .font(.system(size: 32, weight: .medium, design: .default ))
                    .foregroundColor(.white)
                    
                
                VStack(spacing: 10 ){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("23°C ")
                        .font(.system(size: 70, weight:.medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
                 

                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "MON", imageName: "sun.max.fill", Temperature: 25)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", Temperature: 23)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", Temperature: 10)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.bolt.rain.fill", Temperature: 18)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.fog.fill", Temperature: 20)
                    
                }
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Change Day Time")
                }
                .font(.system(size: 20, weight: .bold))
                .frame(width: 280, height: 40)
                .background(Color.white)
                
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


struct WeatherDayView : View
{
    var dayOfWeek: String
    var imageName: String
    var Temperature: Int
    
    
    var body: some View{
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default ))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40 )
            Text("\(Temperature)°")
                .font(.system(size: 20, weight: .medium ))
                .foregroundColor(.white)
            
        }
    }
   
}
