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
    let kaabaLocation = CLLocationCoordinate2D(latitude: 21.422487, longitude:39.826206)
    let arafaatLocation = CLLocationCoordinate2D(latitude: 21.422487, longitude:39.9841)
    let menaLocation = CLLocationCoordinate2D(latitude: 21.4146, longitude:39.8946)

    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Do any additional setup after loading the view.
        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"الكعبه", coordinate:kaabaLocation))

        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"جبل عرفات ", coordinate:arafaatLocation))
        
        map.addAnnotation(HotelMapDetailsView(hotelName:"مكه المكرمه", hotelLocation:"مِنى", coordinate:menaLocation))

    
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: kaabaLocation)
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: arafaatLocation)
        showRouteOnMap(pickupCoordinate: roomLocation, destinationCoordinate: menaLocation)

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
            
            
            if annotation.coordinate.latitude == kaabaLocation.latitude &&   annotation.coordinate.longitude == kaabaLocation.longitude
            {
                return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "kaaba-icon"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                    if let redView = infoView as? MapInfoHotelView
                    {
                        redView.update(withHotel: view)
                    }
                })
            }
            else if annotation.coordinate.latitude == arafaatLocation.latitude &&   annotation.coordinate.longitude == arafaatLocation.longitude
            {
                return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "araafat-icon"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                    if let redView = infoView as? MapInfoHotelView
                    {
                        redView.update(withHotel: view)
                    }
                })
            }
            else if annotation.coordinate.latitude == menaLocation.latitude &&   annotation.coordinate.longitude == menaLocation.longitude
            {
                return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "mena-icon"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                    if let redView = infoView as? MapInfoHotelView
                    {
                        redView.update(withHotel: view)
                    }
                })
            }
            else
            {
                return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "location-icon"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                    if let redView = infoView as? MapInfoHotelView
                    {
                        redView.update(withHotel: view)
                    }
                })
            }
        }
        
        // Create classic pin which cant show custom info view, it will show native callout
        return HCPinAnnotationView.hcCreateDefaultPin(forMap: mapView, forAnnotation: annotation, withReuseIdentifier: "BasicMapPin")
      
    }
    
    
    
    // MARK: - showRouteOnMap
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        

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
        let directions = MKDirections(request: directionRequest)
        
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
