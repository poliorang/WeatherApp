//
//  LocationManagerImpl.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 23.03.2024.
//

import CoreLocation
import Foundation

final class LocationManagerImpl: NSObject, LocationManager {

    // MARK: - Private properties
    
    private let preferredLocale = Locale(identifier: "en")
    private let geocoder = CLGeocoder()
    private let manager = CLLocationManager()
    private var completion: ((CLLocation) -> Void)?
    
    // MARK: - Public functions
    
    public func getUserLocationCoordinates(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    public func getCityNameFromCoordinates(latitude: Double?, longitude: Double?, completion: @escaping (String?) -> Void) {
        guard let latitude = latitude, let longitude = longitude else {
            completion(nil)
            return
        }
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geocoder.reverseGeocodeLocation(location, preferredLocale: preferredLocale) { (placemarks, error) in
            if let error = error {
                completion(nil)
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                if let city = placemark.locality {
                    completion(city)
                    print("City: \(city)")
                } else {
                    completion(nil)
                    print("City name not found")
                }
            } else {
                completion(nil)
                print("Placemark not found")
            }
        }
    }
    
}
 
extension LocationManagerImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        completion?(location)
        manager.startUpdatingLocation()
    }
}
