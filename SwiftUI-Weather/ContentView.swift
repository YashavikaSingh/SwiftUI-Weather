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
            BackgroundView ( topColor: Color.blue, bottomColor:  Color("lightBlue"))
            VStack{
                CityTextView(CityName: "Brooklyn, NY"  )
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", Temperature: 25)
                 
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
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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

struct BackgroundView : View {
    
  
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]) , startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var CityName: String
         var body: some View {
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default ))
            .foregroundColor(.white)
            .padding()
    }
}

struct  MainWeatherStatusView: View {
    var imageName: String
    var Temperature: Int
    var body: some View {
        VStack(spacing: 10 ){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(Temperature)°")
                .font(.system(size: 70, weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

