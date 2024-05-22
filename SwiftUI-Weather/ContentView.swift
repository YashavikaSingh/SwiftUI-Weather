//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Yashavika Singh on 22.05.24.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView ( isNight: $isNight)
            VStack{
                CityTextView(CityName: "Brooklyn, NY"  )
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", Temperature: 25)
                 
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "MON", imageName: isNight ? "moon.fill" :  "sun.max.fill", Temperature: 25)
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", Temperature: 23)
                    WeatherDayView(dayOfWeek: "WED", imageName: isNight ? "tornado" : "wind.snow", Temperature: 10)
                    WeatherDayView(dayOfWeek: "THU", imageName: isNight ? "cloud.moon.bolt.fill" : "cloud.bolt.rain.fill", Temperature: 18)
                    WeatherDayView(dayOfWeek: "FRI", imageName: isNight ?  "moon.haze.fill" :  "cloud.fog.fill", Temperature: 20)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
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
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue ,  isNight ? .gray : Color("lightBlue")]) , startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
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

