-- Database: PizzaHut

-- DROP DATABASE IF EXISTS "PizzaHut";

CREATE DATABASE "PizzaHut"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

	create table Customers(

    customer_id int primary key,
	name varchar (50),
	phone_number varchar (50),
	adress varchar (255),
	createdAt timestamp default current_timestamp
	);

	select*from Customers;

	insert into Customers
	(customer_id, name, phone_number, adress, createdAt)
	values
	(1,'Ali', '923005065784', 'Rasolabbad coloni street no3', '2024-01-10  8:30:00'),
	(2,'HAmza', '923005065785', 'rehman coloni street no2', '2024-03-12  1:30:00'),
	(3,'Ali', '923005065789', 'Rasolabbad coloni street no3', '2024-11-10  2:30:00'),
	(4,'Hamza', '923005065780', 'Defence coloni street no1', '2024-01-10  8:30:00');



   create table Products(
   product_id int primary key,
   product_name varchar (100),
   description text,
   catagory varchar (100),
   price decimal (10,2),
   createdat timestamp default current_timestamp
   );    

	select*from Products;	 


	insert into products
	(product_id , product_name ,description , catagory ,price ,createdat )
	values
	(1,'special pizza','A famous Pizza','Small',550, '2024-01-10  8:00:00'),
	(2,'Arabian green pizza','Green Souice cheese','Medium',1100, '2024-01-11  9:00:00'),
	(3,'Fajia pizza','chese olives Chicken','Larg',1550, '2024-02-13  8:00:00'),
	(4,'special pizza','A famous Pizza Diffrent Souses','Small',550, '2024-01-10  8:00:00');
	
	
	create table Oders(
    oder_id int primary key,
	customer_id int,
	oder_date timestamp default current_timestamp,
	total_amount decimal (10,2),
	status varchar (109),
	foreign key (customer_id) references Customers (customer_id)
	);


	
	select* from Oders;

	insert into Oders
	(oder_id, customer_id, oder_date,total_amount, status)
	values
	(1,4, '2024-01-10 8:00:00', 2000, 'completed'),
	(2,3, '2024-01-11 9:00:00', 1000, 'Pending'),
	(3,1, '2024-01-12 10:00:00', 5000, 'completed'),
	(4,2, '2024-01-15 11:00:00', 3000, 'Pending');


	create table  OderDetails(
    oderdetail_id int primary key,
	oder_id int,
	product_id int,
	quantity int,
	price decimal (10,2),
	foreign key (oder_id) references Oders (oder_id),
	foreign key (product_id) references Products (product_id)
	);

	
	

	insert into OderDetails
	(oderdetail_id ,oder_id ,product_id ,quantity ,price   )
	values
    (1,1,1,10,1000),
	(2,2,2,20,2000),
	(3,3,3,60,5000),
	(4,4,4,10,1000);



	create table Employees (
    employee_id int primary key,
	first_name varchar (50),
	last_name varchar (50),
	position varchar (50),
	salary decimal (10,2),
	hire_date Timestamp default current_timestamp
	);

	select*from Employees;

	insert into Employees
	( employee_id ,first_name,last_name,position ,salary ,hire_date)
	values
	(1,'Ali','Talha', 'Manager', 50000,'2024-01-10'),
	(2,'Ali','Hassan', 'Manager', 40000,'2022-01-10'),
	(3,'Hamza','Siddique', 'Delivery Boy', 20000,'2023-01-10'),
	(4,'Amir','Talha', 'Waiter', 10000,'2024-05-10');


	create table Inventory (
    product_id int,
	quantity_in_stock int,
	record_level int,
	last_update timestamp default current_timestamp,
	foreign key ( product_id) references Products (product_id)
	);

	select *from Inventory;

	insert into Inventory
	(product_id ,quantity_in_stock ,record_level ,last_update )
    values
	(1,50,70,'2024-10-01'),
	(2,10,20,'2024-05-02'),
	(3,60,100,'2024-03-21'),
	(4,20,80,'2024-04-01');
	

   -- quries oder by specif customer
   select * from Oders
   where customer_id =4;

   -- update a custmer email

   update Customers
   set email = 'HAMZA@gmail.com'
   where customer_id = 1;

   -- update products prices

   update Products
   set  price= 100000
   where product_id =4;

   --delete customer record

   delete from Customers
   where customer_id = 1;


   -- delete products records 
   delete from Products 
   where product_id =1;


   -- intermedite quries  joins
   --retrive oder detail including products dates

   select od.oder_id, p.product_name, od.quantity,od.price
   from OderDetails od
   join Products p on od.product_id= p.product_id;


   -- retrives oders with customer informations

   select o.oder_id ,c.name, o.oder_date, o.total_amount
   from Oders o
   join Customers c on o.customer_id =c.customer_id;

   -- agregation quries 

   
	