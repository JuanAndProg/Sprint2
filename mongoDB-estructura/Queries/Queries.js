db.Restaurants.find({})
db.Restaurants.find({ }, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})
db.Restaurants.find({ }, {_id: 0,restaurant_id: 1, name: 1, borough: 1, cuisine: 1})
db.Restaurants.find({ }, {_id: 0,restaurant_id: 1, name: 1, borough: 1, zipzipcode: 1})
db.Restaurants.find({borough: "Bronx"})
db.Restaurants.find({borough: "Bronx"}).limit(5)
db.Restaurants.find({borough: "Bronx"}).skip(5).limit(5)
db.Restaurants.find({"grades.score":{$gt:90}})
db.Restaurants.find({$and: [{"grades.score": {$gt:80}}, {"grades.score": {$lt:100}}]}) 
db.Restaurants.find({"address.coord":{$lt:-95.754168}})
db.Restaurants.find({$and: [{cuisine: { $ne: "American " },"grades.score":{$gt:70},"address.coord":{$lt:-65.754168}}]})
db.Restaurants.find({cuisine: { $ne: "American " },"grades.score":{$gt:70},"address.coord":{$lt:-65.754168}})
db.Restaurants.find({cuisine: { $ne: "American " },"grades.grade":"A","borough": { $ne: "Brooklyn" }}).sort( { "cuisine": -1 })
db.Restaurants.find({name: {"$regex": /^Wil/}},{_id:1,name: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({name: {"$regex": /ces$/}},{_id:1,name: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({name: {"$regex": /Reg/i}},{_id:1,name: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({"borough": "Bronx", cuisine: { $in: ["American ", "Chinese"] }})
db.Restaurants.find({borough: { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] }},{_id:1,nam: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] }},{_id:1,nam: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({"grades.score": {$lt:10}},{_id:1,nam: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({$and: [{cuisine: { $ne: "Chinese" }, cuisine: { $ne: "American " }, cuisine: "seafood"}, {name: {"$regex": /^Wil/}}]},{_id:1,name: 1 ,borough:  1 ,cuisine: 1})
db.Restaurants.find({$and: [{"grades.grade": "A"}, {"grades.score": 11 }, {"grades.date": { $eq: ISODate("2014-08-11T00:00:00Z") } } ]},{_id:1,name: 1 ,grades:  1 })
db.Restaurants.find({$and: [{"grades.1.grade": "A"}, {"grades.1.score": 9 }, {"grades.1.date": { $eq: ISODate("2014-08-11T00:00:00Z") } } ]},{_id:1,name: 1 ,grades:  1 })
db.Restaurants.find({$and: [{"grades.score":{$gt:42},"address.coord":{$lt:52}}]},{_id:1,name: 1 ,address: 1,borough: 1 })
db.Restaurants.find({}).sort( { "name": 1 })
db.Restaurants.find({}).sort( { "name": -1 })
db.Restaurants.find({}).sort( { "cuisine": 1, "borough": -1 })
db.Restaurants.find({ "address.street": null })
db.Restaurants.find({"address.coord":{$type: "double"}})
db.Restaurants.find({ "grades.score": { $mod: [ 7, 0 ] }}, {restaurant_id: 1,name: 1 , grades : 1 })
db.Restaurants.find({name: {"$regex": /mon/i}},{name: 1 ,borough:  1, "address.coord": 1  ,cuisine: 1})
db.Restaurants.find({name: {"$regex": /^Mad/}},{name: 1 ,borough:  1, "address.coord": 1  ,cuisine: 1})