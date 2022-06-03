drop table order_history
drop table customer_orders
drop table customer_info
drop table pega_inventory

CREATE TABLE [dbo].[customer_info]
(
    [customer_id] INT Identity(1000,1) PRIMARY KEY, -- Primary Key column
    [first_name] nvarchar(100) not null,
    [last_name] nvarchar(100) not null,
    [street_address] NVARCHAR(100) not null,
    [zip_code] int not null,
    [area_code] int not null, 
    [primary_phone] int not null,
    [card_type] NVARCHAR (100) not null, 
    [card_number] bigint not null, 
    [security_code] int not null, 
    [expiration_month] NVARCHAR (100) not null, 
    [expiration_year] int not null,
);

CREATE TABLE [dbo].[pega_inventory]
(
    [product] nvarchar(100) not null,
    [price] money not null,
 
);

CREATE TABLE [dbo].[order_history]
(
    [customer_id] INT REFERENCES customer_info(customer_id), 
    [customer_name] NVARCHAR (100) not null,
    [product] nvarchar(100) not null,
    [quantity] int not null,
    [price] money not null,
    [total] money not null,
    [grand_total] money not null, 
);
==================================================================
drop table payment_info
create table [dbo].[payment_info]
(   
    [customer_id] 
    [card_type] text not null, 
    [card_number] bigint not null, 
    [security_code] int not null, 
    [expiration_month] text not null, 
    [expiration_year] int not null,
);
GO

--customer_info, customer_orders, payment_info

=======================
INSERT INTO [dbo].[pega_inventory]
(
 [product], [price]   
)
VALUES
(
    'Chai', '2.00'
),

(
    'Chang', '19.00'
),

(
    'Chartreuse verte', '18.00'
),
(
    'Cote de Blaye', '263.50'
),
(
    'Guarana Fantastica', '4.50'
),
(
    'Ipoh Coffee', '46.00'
),
(
    'Lakkalikoori', '18.00'
),
(
    'Laughing Lumberjack Lager', '14.00'
),
(
    'Outback Lager', '15.00'
),
(
    'Rhonbrau Klosterbier', '7.76'
),
(
    'Sasquatch Ale', '14.00'
),
(
    'Steeleye Stout', '18.00'
);
GO

--add data to the customer info table
INSERT INTO [dbo].[customer_info]
(
 [first_name], [last_name], [street_address], [zip_code], [area_code], [primary_phone], 
 [card_type], [card_number], [security_code], [expiration_month], [expiration_year]  
)
VALUES
(
    'Robert', 'Hopper', '1695 New Creek Road', '36853', '256', '8258096',
    'Mastercard', '5547478188953140', '911', 'November', '2020'
),
(
    'Richard', 'Hartman', '4012 Thompson Drive', '94612', '510', '4190627',
    'Mastercard', '5467582979180430', '439', 'November', '2020'
),
(
    'Clifton', 'France', '4205 Lunetta Street', '33868', '941', '3218119',
    'Mastercard', '5103118937774820', '808', 'December', '2020'

),
(
    'Harriet', 'Fogle', '4652 Bee Street', '49425', '231', '8217950',
    'Mastercard', '4556868356166510', '143', 'April', '2020'
),
(
    'John', 'Mabry', '766 Emily Renzelli Boulevard', '95045', '813', '6234205',
    'Mastercard', '4929337030159810', '887', 'February', '2020'
);
GO

SELECT * FROM [dbo].[customer_info];

--add data to payment info table

INSERT INTO [dbo].[payment_info]
(
    [card_type], [card_number], [security_code], [expiration_month],
    [expiration_year]
)
VALUES
(
    'Mastercard', '5547478188953140', '911', 'November', '2020'
),
(
    'Mastercard', '5467582979180430', '439', 'November', '2020'
),
(
    'Mastercard', '5103118937774820', '808', 'December', '2020'
),
(
    'Visa', '4556868356166510', '143', 'April', '2020'
),
(
    ''Visa', '4929337030159810', '887', 'February', '2020'
);
GO

select * from [dbo].[payment_info];

    
