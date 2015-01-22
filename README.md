asgoodasnew-docker-mongodb
==========================

Base Docker image to run MongoDb

Running the MongoDB Server
--------------------------

Run the following command to start MongoDB:

        docker run -d -p 27017:27017 asgoodasnew/mongodb

Running in authenticated mode
-----------------------------

If you want to enable authentication run the following command to start Mongodb:

        docker run -d -p 27017:27017 -e MONGO_ADMIN=<adminuser> -e MONGO_PASSWORD=<adminpassword> asgoodasnew/mongodb

Predefined Databases with Admin-User
------------------------------------

If you want to have predefined Databases the Admin user has access to, you can run:

        docker run -d -p 27017:27017 -e MONGO_ADMIN=<adminuser> -e MONGO_PASSWORD=<adminpassword> -e MONGO_DBS="mydb1 mydb2 mydb3" asgoodasnew/mongodb

