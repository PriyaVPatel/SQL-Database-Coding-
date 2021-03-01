create table supplier (
    supplier_ID int not null primary key, 
    supplier_name text not null, 
    supplier_street text not null, 
    supplier_city text not null, 
    supplier_state text not null, 
    supplier_zip int not null, 
    supplier_country text not null
);

insert into supplier 
values (1, "Alliance Cigar", "4432 Bouncing Alley", "Charlotte", "NC", 28213, "USA");

insert into supplier 
values (2, "Santa Clara Cigars", "55 N Main Street", "Columbia", "MD", 21045, "USA");

insert into supplier 
values (3, "MDC Wholesale Cigars", "9233 Seneca Drive", "Richmond", "VA", 23223, "USA");

insert into supplier 
values (4, "Holts Cigar Company", "54 North Street", "Winter Park", "FL", 32789, "USA");

insert into supplier 
values (5, "Thompson Cigars", "78 Nancy Place", "Huntington Park", "CA", 90001, "USA");

insert into supplier 
values (6, "Famous Smokes", "7743A Caring Valley Road", "Flint", "MD", 21233, "USA");

select * from supplier;

create table employee (
    employee_ID int not null primary key, 
    f_name text not null, 
    mid_init text, 
    l_name text not null, 
    employee_street text not null, 
    employee_city text not null, 
    employee_state text not null, 
    employee_zip int not null, 
    gender text not null, 
    phone int not null, 
    email text not null, 
    date_hired date not null, 
    dob date not null, 
    ssn int not null
);

insert into employee 
values (1, "Donald", null, "McDonald", "4566 Foully Ave", "Silver Spring", "MD", 20901, "M", 3012234452, "JMcdogery@gmail.com", '2020-9-12', '1996-5-14', 333564532);

insert into employee 
values (2, "Sherry", "F",  "Flemming", "779A Daring Lane", "Largo", "MD", 20774, "F", 2405567783, "sherry@gmail.com", '2020-9-12', '1997-5-22', 445863345);

insert into employee 
values (3, "Bonnie", "D", "Bird", "2 Jailbreak Drive", "Bowie", "MD", 20716, "F", 3014468890, "birdie@gmail.com", '2020-9-6', '1972-2-4', 226785543);

insert into employee 
values (4, "Jim", null, "Carry", "3221 Flock Lane Ave", "Crownsville", "MD", 21032, "M", 2406673381, "notcarrythesinger@gmail.com", '2020-9-5', '1985-7-21', 554632456);

insert into employee 
values (5, "Carie", "H", "McDonald", "4566 Foully Ave", "Silver Spring", "MD", 20901, "F", 3014456678, "CMcdogery@gmail.com", '2020-9-12', '1997-5-7', 333456778);

insert into employee 
values (6, "Doug", "D",  "McMan", "4567 Foully Ave", "Silver Spring", "MD", 20901, "M", 2405567743, "dougdougtheman@gmail.com", '2020-9-7', '1996-3-4', 343225867);

select * from employee;

create table orders (
    order_ID int not null primary key, 
    supplier_ID int not null,  
    employee_ID int not null,  
    order_date date not null, 
    order_shipped date, 
    order_delivery date, 
    order_status text not null,
foreign key (supplier_ID) references supplier(supplier_ID),
foreign key (employee_ID) references employee(employee_ID)
);

insert into orders 
values (1, 1, 4, '2020-10-5', '2020-10-12', '2020-10-19', "Delivered");

insert into orders 
values (2, 1, 1, '2020-10-12', '2020-10-19', '2020-10-26', "Delivered");

insert into orders 
values (3, 5, 2, '2020-10-19', '2020-10-26', '2020-11-2', "Delivered");

insert into orders 
values (4, 6, 2, '2020-10-26', '2020-11-2', '2020-11-9', "Delivered");

insert into orders 
values (5, 4, 6, '2020-11-2', '2020-11-9', null, "Shipped");

insert into orders 
values (6, 4, 3, '2020-11-9', null, null, "Processing");

select * from orders;

create table brand (
    brand_ID int not null primary key, 
    brand_name text not null, 
    brand_type text
);

insert into brand 
values (1, "Arturo Fuente", "Anejo Lancero");

insert into brand 
values (2, "Davidoff", "Signature Series");

insert into brand 
values (3, "Davidoff", "Signature Petit Corona");

insert into brand 
values (4, "Cohiba", "Black");

insert into brand 
values (5, "Cohiba", "Extra Vigoroso XV 554");

insert into brand 
values (6, "Padron", "Anniversary Imperial Maduro");

insert into brand 
values (7, "Drew Estate", "Acid Croqueta");

insert into brand 
values (8, "Macanudo", "Cafe Thames");

select * from brand;

create table product (
    product_ID int not null primary key, 
    brand_ID int not null, 
    product_rating int, 
    product_year int, 
    product_length numeric, 
    product_ringGuage numeric, 
    product_country text, 
    product_filler text, 
    product_wrapper text, 
    product_color text, 
    product_strength text, 
foreign key (brand_ID) references brand(brand_ID)
);

insert into product 
values (1, 1, 95, null, 7.4, 41, "DR", "DR", "CTB/USA", "Maduro", "Full");

insert into product 
values (2, 2, 91, 2000, 5, 43, "DR", "DR", "CT/ECU", "Claro", "Mild-Medium");

insert into product 
values (3, 3, 90, null, 4.5, 41, "DR", "DR", "ECU", "Colorado Claro", "Medium-Full");

insert into product 
values (4, 4, 93, null, 6.12, 50, "DR", "DR/MEX", "CTB", "Oscuro", "Medium-Full");

insert into product 
values (5, 5, 93, null, 5, 54, "DR", "DR/NIC", "ECU/SUM", "Colorado Maduro", "Full");

insert into product 
values (6, 6, 95, 1964, 6, 52, "NIC", "NIC", "NIC", "Maduro", "Full");

insert into product 
values (7, 7, 95, null, 2.5, 50, "NIC", "NIC", "MEX", "Maduro", "Medium");

insert into product 
values (8, 8, 88, null, 6, 50, "DR", "DR/MEX", "CTS/USA", "Claro", "Mild");

select * from product;

create table order_items (
    orderItem_ID int not null primary key, 
    order_ID int not null, 
    product_ID int not null,
    orderItem_quantity int not null, 
    orderItem_wholesale_price numeric not null,
    orderItem_discount numeric not null,
foreign key (order_ID) references orders(order_ID),
foreign key (product_ID) references product(product_ID)
);

insert into order_items 
values (1, 1, 1, 10, 10, 0);

insert into order_items 
values (2, 1, 2, 10, 10, 0);

insert into order_items 
values (3, 1, 3, 10, 10, 0);

insert into order_items 
values (4, 1, 4, 10, 10, 0);

insert into order_items 
values (5, 2, 5, 10, 10, 0);

insert into order_items 
values (6, 2, 6, 10, 10, 0);

insert into order_items 
values (7, 2, 7, 10, 10, 0);

insert into order_items 
values (8, 3, 8, 10, 10, 0);

insert into order_items 
values (9, 3, 1, 5, 10, 0);

insert into order_items 
values (10, 4, 2, 5, 10, 0);

insert into order_items 
values (11, 5, 3, 5, 10, 0);

insert into order_items 
values (12, 6, 4, 5, 10, 0);

select * from order_items;

create table stock (
    stock_ID int not null primary key, 
    product_ID int not null, 
    stock_quantity int not null, 
foreign key (product_ID) references product(product_ID)
);

insert into stock 
values (1, 1, 15);

insert into stock 
values (2, 2, 15);

insert into stock 
values (3, 3, 10);

insert into stock 
values (4, 4, 10);

insert into stock 
values (5, 5, 10);

insert into stock 
values (6, 6, 10);

insert into stock 
values (7, 7, 10);

insert into stock 
values (8, 8, 10);

select * from stock;

create table walk_in_purchase (
    purchase_ID int not null primary key,
    employee_ID int not null, 
    purchased_date datetime not null,
foreign key (employee_ID) references employee(employee_ID)
);

insert into walk_in_purchase
values (1, 4, '2020-11-20 08:45:56');

insert into walk_in_purchase
values (2, 4, '2020-11-21 14:37:12');

insert into walk_in_purchase
values (3, 2, '2020-11-21 20:02:58');

select * from walk_in_purchase;

create table purchased_items (
    purchased_items_ID int not null primary key,
    purchase_ID int not null, 
    product_ID int not null,
    purchase_quantity int not null,
foreign key (purchase_ID) references walk_in_purchase(purchase_ID),
foreign key (product_ID) references product(product_ID)
); 

insert into purchased_items 
values (1, 1, 1, 5);

insert into purchased_items 
values (2, 1, 4, 5);

insert into purchased_items 
values (3, 2, 1, 5);

insert into purchased_items 
values (4, 3, 6, 5);

insert into purchased_items 
values (5, 3, 4, 5);

insert into purchased_items 
values (6, 3, 8, 5);

select * from purchased_items;

select * from orders; 

update orders 
set order_delivery = '2020-11-16', 
    order_status = 'Delivered'
where order_ID = 5;

update orders
set order_shipped = '2020-11-16',
    order_status = 'Shipped'
where order_ID = 6;

select * from orders; 

select brand_name, 
    brand_type, 
    stock_quantity
from brand 
    left join stock
on brand.brand_ID = stock.stock_ID; 

update stock
set stock_quantity = stock_quantity + (select (orderItem_quantity) 
    from order_items 
    where  order_items.order_ID = 5)
where stock.product_ID = (select (product_ID)
    from order_items
    where  order_items.order_ID = 5);
    
select brand_name, 
    brand_type, 
    stock_quantity
from brand 
    left join stock
on brand.brand_id = stock.stock_ID;

select s.supplier_Name,
    orders.order_ID
from supplier s
    join orders on s.supplier_ID = orders.supplier_ID 
group by s.supplier_Name, orders.order_ID
order by s.supplier_Name;

select product.product_rating,
    brand.brand_name, 
    brand.brand_type, 
    stock_quantity
from product 
    join brand on brand.brand_ID = product.brand_ID
    join stock on stock.product_ID = product.product_ID
group by brand.brand_name, brand.brand_type
order by product.product_rating desc, brand.brand_name asc;

select order_items.order_ID,
    brand.brand_name, 
    brand.brand_type,
    order_items.orderItem_quantity
from brand 
    join order_items on brand.brand_ID = order_items.product_ID;

select orders.order_ID, 
    employee.l_name, 
    employee.f_name 
from employee 
    join orders on employee.employee_ID = orders.employee_ID 
group by employee.l_name, employee.f_name, orders.order_ID 
order by orders.order_ID, employee.l_name; 

select brand.brand_ID,
    brand.brand_name, 
    brand.brand_type 
from brand 
    join product on brand.brand_ID = product.brand_ID; 

select walk_in_purchase.purchase_ID,
    employee.l_name, 
    employee.f_name
from employee 
    join walk_in_purchase 
    on employee.employee_ID = walk_in_purchase.employee_ID; 

