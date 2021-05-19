//
//  ContentView.swift
//  WeatherApp
//
//  Created by Keven Qiu on 2021-05-16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight) // binding variable
            
            VStack {
                CityView(cityName: "Saskatoon, SK")
                
                Text("Today")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 21)
                
                HStack(spacing: 20) {
                    WeatherView(dayOfWeek: "MON", imageName: "sun.max.fill", temp: 27)
                    WeatherView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 19)
                    WeatherView(dayOfWeek: "WED", imageName: "cloud.bolt.rain.fill", temp: 10)
                    WeatherView(dayOfWeek: "THU", imageName: "smoke.fill", temp: 13)
                    WeatherView(dayOfWeek: "FRI", imageName: "snow", temp: -3)
                }
                
                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    changeTimeButton(text: "Change Time of Day", textColour: .blue, bkgColour: .white)
                }
                
                Spacer() // 6 views
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°C")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 90)
    }
}
