##Setup
####Versions:
  Ruby: 2.3.1  
  Rails: 5.0.0.1
  
####After cloning the repo do:  
    bundle install
    rake db:migrate
    rake db:seed
    rails s

####User seed data (for login etc.):
    email: 'koop@koop.se',
    password: 'admin123',
    address:'Vintergatan 7',
    city: 'Jönköping'
    
##Heroku
https://secure-wildwood-20129.herokuapp.com  
Use the following user credentials when logging in(or register a new user, but then the seed suppliers won't be there):  
**Email:** Koop@koop.se  
**Password:** admin123

##Last words
Writing this at: 16:16 Nov 10  
All in all it's taken me about 8 hours to get to this point, though I feel like there's something missing to my testing.  
Devise made it a bit more complicated to do testing compared to if I hadn't used it.  
Finally got controller tests to work.  
My version ended up being more dynamic in that a user represents a store, so you could technically have as many stores as you like with all different suppliers etc.  
It doesn't make it harder for a single store to use the application though.  
#####Total time: 8 hours

 
##Initial planning - Start 09:17 Nov 10

Estimated time: ~10 hours
Local food store, meaning single origin? Means we could probably get away with not using a login system -- Come back to that later
Suppliers contact info and location (Google or MapZen API)
Categories that specify what type of items the supplier is delivering
Finding efficient transport ways (Google maps will probably be easiest for this, so we generate a route between the store and the supplier)
Definitely using Devise for this, that will allow make the application more secure while allowing me to save the store address and expand the application in an easy manner.

####Database Planning

We need the user table of course, devise will provide that for us, so we need to add store address to that table. What format does google maps take on their address? Assuming the application will be used only in Sweden (Or Europe), our address format should be "Street Address, City, Country"  
At this point we have our projected user table - **User(Devise, Address:String)**  
Next we need a table to store our suppliers, so let's do something like;  
**Suppliers(Name:String, Address:String, Email:String, Phone:String, Website:String)**  
Then we need a table for the types of things the supplier is delivering, I'll call that table tags.  
**Tags(Tag:String)**  
And to connect the two we need a relational table between Tags and Suppliers  
**Tags_Suppliers(tag_id:String, supplier_id:String)**
So  
**Suppliers has_many :tags through: tags_suppliers**  
**Tags has_many :suppliers through: tags_suppliers**  

At this point we probably have most of the database needed to start doing some scaffolding  
**User(Devise, Address:String)  
Suppliers(Name:String, Address:String, Email:String, Phone:String, Website:String)  
Tags(Tag:String)  
Tags_Suppliers(tag_id:String, supplier_id:String)**  

####Startup commands (More specifically scaffolds)
This happens after devise is setup --  
**rails g scaffold Suppliers name:string address:string email:string phone:string website:string  
rails g scaffold Tags tag:string**  
Then setup the relational table and add the relations to the scaffold models 

####Design
For the design we use Bootstrap and ajax to load and send forms in a fast and user friendly manner

Planning done 09:58 Nov 10, Total Time ~40 minutes

