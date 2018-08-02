//
//  MapViewController.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit
import MapKit
import HCMapInfoView

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var roomLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.759011, longitude: -73.984472)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let KaabaLocation = CLLocationCoordinate2D(latitude: 21.422487, longitude:39.826206)
        let ArafaatLocation = CLLocationCoordinate2D(latitude: 21.422487, longitude:39.9841)
        let MenaLocation = CLLocationCoordinate2D(latitude: 21.4146, longitude:39.8946)
    
        let dummyLocation = CLLocationCoordinate2D(latitude: 40.748441, longitude: -73.985564)

        
        // Do any additional setup after loading the view.
        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"الكعبه", coordinate:KaabaLocation, image:#imageLiteral(resourceName: "ka3ba")))

        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"جبل عرفات ", coordinate:ArafaatLocation, image:#imageLiteral(resourceName: "araaft")))
        
        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"منا ", coordinate:MenaLocation, image:#imageLiteral(resourceName: "araaft")))
        
        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه", hotelLocation:"الكعبه", coordinate:roomLocation, image:#imageLiteral(resourceName: "ka3ba")))

        
        map.addAnnotation(HotelMapDetailsView(hotelName:" المكرمه", hotelLocation:"test ", coordinate:dummyLocation, image:#imageLiteral(resourceName: "araaft")))


    
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: KaabaLocation)
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: ArafaatLocation)
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: MenaLocation)
        
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: dummyLocation)


    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension MapViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let view = annotation as? HotelMapDetailsView
        {
            return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "location-icon"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                if let redView = infoView as? MapInfoHotelView
                {
                    let directions = self.directionsFor(pickupCoordinate: self.roomLocation, destinationCoordinate: annotation.coordinate)
                    
                    self.routeForDirections(directions: directions, completion: { (route) in
                    
                        var travelTime = Int(route?.expectedTravelTime ?? 0)
                        let isHoursTimeUnit = travelTime > 3600
                        let timeUnit = isHoursTimeUnit ? "hours" : "mins"
                        travelTime = isHoursTimeUnit ? travelTime / 3600 : travelTime / 60
                        redView.travelTimeLabel.text = travelTime > 0 ? "\(travelTime) \(timeUnit)": ""
                    })
                    redView.update(withHotel: view)
                }
            })
        }
        
        // Create classic pin which cant show custom info view, it will show native callout
        return HCPinAnnotationView.hcCreateDefaultPin(forMap: mapView, forAnnotation: annotation, withReuseIdentifier: "BasicMapPin")
      
    }
    
    
    
    // MARK: - showRouteOnMap
    
    func directionsFor(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) -> MKDirections {
        

        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes = true
        
        // Calculate the direction
        return MKDirections(request: directionRequest)
    }
    
    func routeForDirections(directions: MKDirections, completion: ((MKRoute?) -> ())?) {
        
        directions.calculate { (response, error) in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            completion?(response.routes.first)
        }
    }
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        let directions = directionsFor(pickupCoordinate: pickupCoordinate, destinationCoordinate: destinationCoordinate)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }

            
            let route = response.routes[0]
            
            self.map.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        
        renderer.lineWidth = 5.0
        
        return renderer
    }
    
    
    
}
