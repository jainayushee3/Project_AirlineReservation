create database dbAirlineReservation
use dbAirlineReservation
drop database dbAirlineReservation

create table tblUser(
User_ID int primary key,
Last_Name varchar(20),
First_Name varchar(20),
Phone varchar(10),
Email varchar(30),
Password varchar(10));

create table tblFlight_Details(
Flight_ID int primary key,
FC_Capacity int,
BC_Capacity int,
EC_Capacity int);

create table tblFlight_Schedule(
Schedule_ID int primary key,
Flight_ID int references tblFlight_Details(Flight_ID),
Source_Loc varchar(20),
Destination varchar(20),
Dep_Time time,
Arr_Time time,
Duration time,
Dep_Date date);

create table tblFlight_Schedule_Details(
Schedule_ID int references tblFlight_Schedule(Schedule_ID) primary key,
Class varchar(10),
Available_Class_Capacity int,
Price float);

create table tblSeat_Details(
Seat_ID int primary key,
Schedule_ID int references tblFlight_Schedule_Details(Schedule_ID),
Seat_No varchar(3),
Seat_Class varchar(10),
Seat_Status varchar(10));

create table tblTicket_Details(
Receipt_ID int primary key,
Schedule_ID int references tblFlight_Schedule(Schedule_ID),
User_ID int references tblUser(User_ID),
Trip_type varchar(5),
Other_Receipt_ID int,
Number_Of_Tickets int,
Tickets_Status varchar(20),
Total_Amount float);

create table tblPassenger_Details(
Passenger_ID int primary key,
Receipt_ID int references  tblTicket_Details(Receipt_ID),
Passenger_Name varchar(30),
Passenger_Age int,
Seat_ID int references tblSeat_Details(Seat_ID));





