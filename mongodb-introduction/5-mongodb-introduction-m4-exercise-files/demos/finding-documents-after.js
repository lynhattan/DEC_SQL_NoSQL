// 1) Switch to the 'demo' database
db = db.getSiblingDB('demo')

// 2) Enter these documents into the collection 'animals'
db.animals.save({ _id: 1, name: 'cat', tags:['land','cute'] ,info:{type:'mammal', color:'red' }})
db.animals.save({ _id: 2, name: 'rabbit', tags:['land','cute'],info:{type:'mammal', color:'white' } })
db.animals.save({ _id: 3, name: 'shark', tags:['ocean'] ,info:{type:'fish', color:'grey' }})
db.animals.save({ _id: 4, name: 'dolphin', tags:['ocean','cute'] ,info:{type:'mammal', color:'grey', canFly: null }})
db.animals.save({ _id: 5, name: 'penguin', tags:['land','ocean','cute'] ,info:{type:'bird', canFly:false }})
db.animals.save({ _id: 6, name: 'duck', tags:['land','cute'], info: {type:'bird', canFly: true} })

// 3) Find all ocean animals

db.animals.find({tags:['ocean']});

// 4) Find all grey animals. This time, only return their name.

db.animals.find({"info.color": 'grey'}, {_id: 0, name: 1});

// 5) Find all animals that that can fly.

db.animals.find({"info.canFly":true}, {_id:0, name:1});

// 6) Find all animal that don't have an 'info.canFly' field at all

db.animals.find({ "info.canFly":{$exists: false}}, {_id:0, name:1});

// 7) Find all animals that have an 'info.canFly' field set to null or that don't have the 'info.canFly' field
db.animals.find({"info.canFly": null}, {_id:0, name:1});

// 8) Find all documents, sorted by their _id in descending order. Return their _id field only

db.animals.find({}, {_id:1}).sort({_id:-1});

// 9) Repeat the last query, this time return only the second and third documents

db.animals.find({}, {_id:1}).sort({_id:-1}).skip(1).limit(2);

// 10) The cursor method forEach() takes a function with a single argument representing each document.
//     Get the names of all animals. Save them in an array in the shell. 
//     Hint: Javascript arrays have a push() method.
//     For example 
//         db.animals.find({}).forEach(function(r){ print(r._id)})

var result = [];
db.animals.find({},{name:1,_id:0}).forEach(function(r){result.push(r.name)})

// The variable result has been assigned. Now type:
//    result + [ENTER]