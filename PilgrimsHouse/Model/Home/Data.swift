//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Data : NSObject, NSCoding, Mappable{

	var address : String?
	var descriptionField : String?
	var distance : String?
	var houseType : String?
	var id : String?
	var isFavorite : Bool?
	var lat : String?
	var lon : String?
	var mediaGallery : [String]?
	var name : String?
	var offer : Bool?
	var oldPrice : String?
	var price : String?
	var rate : String?
	var thumbnail : String?
	var vendor : String?


	class func newInstance(map: Map) -> Mappable?{
		return Data()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		address <- map["address"]
		descriptionField <- map["description"]
		distance <- map["distance"]
		houseType <- map["houseType"]
		id <- map["id"]
		isFavorite <- map["isFavorite"]
		lat <- map["lat"]
		lon <- map["lon"]
		mediaGallery <- map["mediaGallery"]
		name <- map["name"]
		offer <- map["offer"]
		oldPrice <- map["oldPrice"]
		price <- map["price"]
		rate <- map["rate"]
		thumbnail <- map["thumbnail"]
		vendor <- map["vendor"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         distance = aDecoder.decodeObject(forKey: "distance") as? String
         houseType = aDecoder.decodeObject(forKey: "houseType") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         isFavorite = aDecoder.decodeObject(forKey: "isFavorite") as? Bool
         lat = aDecoder.decodeObject(forKey: "lat") as? String
         lon = aDecoder.decodeObject(forKey: "lon") as? String
         mediaGallery = aDecoder.decodeObject(forKey: "mediaGallery") as? [String]
         name = aDecoder.decodeObject(forKey: "name") as? String
         offer = aDecoder.decodeObject(forKey: "offer") as? Bool
         oldPrice = aDecoder.decodeObject(forKey: "oldPrice") as? String
         price = aDecoder.decodeObject(forKey: "price") as? String
         rate = aDecoder.decodeObject(forKey: "rate") as? String
         thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as? String
         vendor = aDecoder.decodeObject(forKey: "vendor") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if distance != nil{
			aCoder.encode(distance, forKey: "distance")
		}
		if houseType != nil{
			aCoder.encode(houseType, forKey: "houseType")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isFavorite != nil{
			aCoder.encode(isFavorite, forKey: "isFavorite")
		}
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lon != nil{
			aCoder.encode(lon, forKey: "lon")
		}
		if mediaGallery != nil{
			aCoder.encode(mediaGallery, forKey: "mediaGallery")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if offer != nil{
			aCoder.encode(offer, forKey: "offer")
		}
		if oldPrice != nil{
			aCoder.encode(oldPrice, forKey: "oldPrice")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if rate != nil{
			aCoder.encode(rate, forKey: "rate")
		}
		if thumbnail != nil{
			aCoder.encode(thumbnail, forKey: "thumbnail")
		}
		if vendor != nil{
			aCoder.encode(vendor, forKey: "vendor")
		}

	}

}