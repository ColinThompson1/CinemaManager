# CinemaManager
A cinema booking and management system to demonstrate an understanding of relational databases. A project for CPSC 471
By: Gee Lin, Jonathan Luong, Colin Thompson, Terry Wu

## Scenario

Various online enterprises offer systems that allow customers to book goods and services with minimal overhead. Google Flights is one such example where cheap flight tickets from all carriers are automatically aggregated into one convenient location; the Atom mobile app displays all cinemas and showing times while also allowing users to easily book seats and order concession items. While these systems simplify the process greatly, they often lack proper visualization of data and make it difficult for end-users to identify relationships when the data is presented as raw numbers. That said, our aim is to create and implement a database with an extensible design that also has the ability to visualize data in an intuitive way through a web browser. We will then extend our database to a cinema booking and management scenario, allowing for data related to theatres, movies, and specific statistics to be viewed and manipulated.

## What We Implemented

* Functionality allowing customers to 'book' (no actual payment) seats and concession items in real-time concurrently
* The ability for customers to view information related to movies (e.g. rating, length, price)
* Functionality enabling administrators to:
  * View all relevant data
  * Maintain current movie titles and showtimes
  * Maintain user and employee data
  * Maintain and update concession inventory
  * A method for visualizing data through dynamic graphs (that allow both administrators and marketers to interpret sales and expenses (e.g. plotting the revenue for specific movie types)

## What We Didn't Get To
* Functionality to display more than 9 movies at a time.
* A method for automatically designating movies times based on available time slots and anticipated movie popularity (depending on the difficulty and timeline of implementing the above, this last feature is tentative)

## Libraries We Used
* DataTables https://datatables.net
* Morris.js http://morrisjs.github.io/morris.js/
* Bootstrap http://getbootstrap.com
* Jquery https://jquery.com
* DatePicker https://eonasdan.github.io/bootstrap-datetimepicker/
