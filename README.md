# Your first assignment

Hi there. 

We are looking for great people that want to excel. Our motto is 'creating happy users', which basically means that we always try to create something that makes the end user really happy. That applies to everything from design to project management to development. A bug-free easy-to-use web application that is delivered in time and within budget is what we aim for. Sometimes we fail in some areas, but we always try our best.

Are you like that? Then write the best web application you can. 

## Background

Your local food store needs a very simple web based tool to keep track of their suppliers. 
They want to be able to add the suppliers with normal contact info, display them on a map and assign them to different categories depending on what kind of things they are delivering (milk, meat, bread etc.). The point of this is to be able to find efficient transport ways and have a nice list of suppliers if we need to contact them regarding deliveries.

Write this as a web application in the current version of Ruby on Rails. 

## Instructions

 * Fork this project into your own Github account. 
 * Do your changes. Use many descriptive commits, as you normally would in a project.
 * Don't forget the tests. Use [Minitest](https://github.com/seattlerb/minitest).
 * Do a pull request with your changes within a week of reading this.
 * Change this readme and include instructions for how to get it running.
 * Bonus points for database seeds or a live version running somewhere we can access.
 * Include an estimate on how much time you would think it takes to develop this kind of app.
 
##Initial planning - Start 09:17 Nov 10

Estimated time: ~10 hours
Local food store, meaning single origin? Means we could probably get away with not using a login system -- Come back to that later
Suppliers contact info and location (Google or MapZen API)
Categories that specify what type of items the supplier is delivering
Finding efficient transport ways (Google maps will probably be easiest for this, so we generate a route between the store and the supplier)
Definitely using Devise for this, that will allow make the application more secure while allowing me to save the store address and expand the application in an easy manner.

##Database Planning

We need the user table of course, devise will provide that for us, so we need to add store address to that table. What format does google maps take on their address? Assuming the application will be used only in Sweden (Or Europe), our address format should be "Street Address, City, Country"  
At this point we have our projected user table - User(Devise, Address:String)  
Next we need a table to store our suppliers, so let's do something like;  
Suppliers(Name:String, Address:String, Email:String, Phone:String, Website:String)  
Then we need a table for the types of things the supplier is delivering, I'll call that table tags.  
Tags(Tag:String)  
And to connect the two we need a relational table between Tags and Suppliers  
Tags_Suppliers(tag_id:String, supplier_id:String)
So  
Suppliers has_many :tags through: tags_suppliers  
Tags has_many :suppliers through: tags_suppliers  

At this point we probably have most of the database needed to start doing some scaffolding  
User(Devise, Address:String)  
Suppliers(Name:String, Address:String, Email:String, Phone:String, Website:String)  
Tags(Tag:String)  
Tags_Suppliers(tag_id:String, supplier_id:String)  

##Startup commands (More specifically scaffolds)
This happens after devise is setup --  
rails g scaffold Suppliers name:string address:string email:string phone:string website:string  
rails g scaffold Tags tag:string  
Then setup the relational table and add the relations to the scaffold models 

##Design
For the design we use Bootstrap and ajax to load and send forms in a fast and user friendly manner

**Planning done 09:58 Nov 10, Total Time ~40 minutes
