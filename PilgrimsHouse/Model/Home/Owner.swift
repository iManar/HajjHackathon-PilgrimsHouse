//
//	Owner.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Owner : NSObject, NSCoding, Mappable{

	var createdOn : String?
	var name : String?
	var phone : String?
    var image : String?


	class func newInstance(map: Map) -> Mappable?{
		return Owner()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		createdOn <- map["createdOn"]
		name <- map["name"]
		phone <- map["phone"]
        image <- map["image"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createdOn = aDecoder.decodeObject(forKey: "createdOn") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         phone = aDecoder.decodeObject(forKey: "phone") as? String
        image = aDecoder.decodeObject(forKey: "image") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if createdOn != nil{
			aCoder.encode(createdOn, forKey: "createdOn")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if phone != nil{
			aCoder.encode(phone, forKey: "phone")
		}

	}

}
