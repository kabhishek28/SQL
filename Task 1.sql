/*Xworkz*/
create database Xworkz;
use Xworkz;
create table Trainee_info(Outlook_id varChar(25), Trainee_name varchar(20), Course_name varChar(20),
PhoneNo int, Gender Char(10), Attendance int(10), Address varChar(20), 
Batch_no int, Date_of_joining varChar(20), Trainer_name varChar(20));

use xworkz;
alter table trainee_info
add qualification varchar(30),
add email varchar(40),
add dob varchar(20),
add feedback varchar(100);

use xworkz;
alter table trainee_info
drop column address;

use xworkz;
alter table trainee_info
rename column outlook_id to email_id,
rename column trainee_name to name,
rename column phoneNo to contact_no,
rename column date_of_joining to joining_date;

use xworkz;
alter table trainee_info
modify column email_id varchar(50),
modify column name varchar(30),
modify column contact_no bigint,
modify column gender varchar(10);

select * from trainee_info;


/*Orders*/
create database orders;
use orders;
create table order_info(order_id int, customerr_id int,order_name varChar(20), order_date varChar(20), 
total_amount int, status varChar(20), address varChar(20), paymentMethod varChar(20), contactNo int, 
delivery_date varChar(20));

use orders;
alter table order_info
add shipping_cost int,
add discount int,
add coupon_code varchar(20),
add delivery_status varchar(20);

use orders;
alter table order_info
drop column status;

use orders;
alter table order_info
rename column customerr_id to customer_id,
rename column order_name to item_ordered,
rename column order_date to placed_on,
rename column total_amount to amount;

use orders;
alter table order_info
modify column customer_id int unsigned,
modify column item_ordered varchar(40),
modify column amount decimal(10, 2),
modify column placed_on date;


/*Movies*/
create database Movie;
use Movie;
create table Movie_info(Movie_name varChar(20), Actor varChar(20), Actress varChar(20), Villian varChar(20),
Release_date varChar(20), Comedian varChar(20), No_of_songs int, Genre varChar(20), Producer varChar(20),
Ratings int);

use movie;
alter table movie_info
add duration int,
add language varchar(20),
add budget int,
add collection int;

use movie;
alter table movie_info
drop column comedian;

use movie;
alter table movie_info
rename column movie_name to title,
rename column release_date to premiered_on,
rename column no_of_songs to song_count,
rename column ratings to review_score;

use movie;
alter table movie_info
modify column title varchar(40),
modify column actor varchar(30),
modify column actress varchar(30),
modify column review_score boolean;


/*Restuarant*/
create database Restuarant;
use Restuarant;
create table Menu(Soup varChar(20), Starter varChar(20), Breads varChar(20), Rice varChar(20), 
North_indian varChar(20), South_indian varChar(20), Chinese varChar(20), Dessert varChar(20), 
Cold_Drinks varChar(20),Hot_Drinks varChar(20));   

use restuarant;
alter table menu
add chef_special varchar(20),
add salad varchar(20),
add side_dish varchar(20),
add kids_menu varchar(20);

use restuarant;
alter table menu
drop column starter;

use restuarant;
alter table menu
rename column soup to soup_type,
rename column rice to rice_type,
rename column chinese to chinese_dish,
rename column dessert to sweet_dish;

use restuarant;
alter table menu
modify column soup_type varchar(30),
modify column rice_type varchar(30),
modify column north_indian varchar(30),
modify column sweet_dish varchar(30);


use Restuarant;
create table customer_orders (order_id int primary key, customer_name varchar(50),
contact_number varchar(15), table_number int, order_date date, soup varchar(20),
main_course varchar(50), dessert varchar(20), beverage varchar(20),total_amount int);

use restuarant;
alter table customer_orders
add waiter_name varchar(30),
add feedback varchar(100),
add payment_status varchar(20),
add tip_amount int;

use restuarant;
alter table customer_orders
drop column soup;

use restuarant;
alter table customer_orders
rename column customer_name to guest_name,
rename column table_number to table_no,
rename column total_amount to bill_amount,
rename column beverage to drinks;

use restuarant;
alter table customer_orders
modify column guest_name varchar(40),
modify column bill_amount decimal(10, 2),
modify column drinks varchar(30),
modify column contact_number int;


select * from movie_info;
  




