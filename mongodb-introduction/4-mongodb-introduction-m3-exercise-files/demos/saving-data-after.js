// 1: Change to a 'demo' database

use demo;
// Another way to achieve this is
// db = db.getSiblingDB('demo');
// You can type:
//     db + [enter] 
// to see what db you are in.

// 2: Create an empty document with _id =1 in the collection foo. Show the document.

db.foo.save({_id:1});

db.foo.find(); // or db.foo.find({_id:1})

// 3: Add a field 'n' to the document you just created, and assign it a value of 12. Show the document.

db.foo.findAndModify({query:{_id:1}, update:{$set:{n:12}}}); 

db.foo.find(); 

// 4: Add 4 to field n who's value is less than 16. Run this update multiple times. Show the document.
// Subsequent updates should not affect the document once n has reached 16.

db.foo.update({n: {$lt: 16}},{$inc: {n: 4}});

db.foo.find();

// 5: Add an array field named 'tags' to your document. Add 'a' to it. Show the document.

db.foo.update({_id:1},{$set: {tags: ['a']}});

db.foo.find();

// 6: Add 'b' and 'c' to the tags array, but ensure that running the command 
// multiple times does not add 'b' or 'c' more than once. Try doing it in 2 different ways

db.foo.update({_id:1},{$addToSet:{tags:'b'}});

db.foo.update({_id:1, tags:{$ne:'c'}},{$push:{tags:'c'}});

// 7: Add 9 more documents with ids ranging from 2 to 10. You can use a javascript for-loop for this.

for(var i=2;i<11;i++){
	db.foo.save({_id:i});
}

// 8: Add a field named 'early' to all documents with id less than or equal 5. Set the field value to boolean true.
// Hint: You will need to update multiple records at once.

db.foo.update({_id:{$lte:5}},{$set:{early:true}},{multi:true});

db.foo.find();

// 9: Remove the array on the document  with id 1 using findAndModify(). Return the modified document (the result of your modification).

db.foo.findAndModify({query: {_id: 1}, update: {$unset: {tags: 1}}, new: true }); 


 