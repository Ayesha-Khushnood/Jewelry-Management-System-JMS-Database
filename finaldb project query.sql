create database JMS_database;

--tables creations + validations + keys + auto increment

CREATE TABLE supplier (
    supplier_no INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    name VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(20),
    item VARCHAR(255),
    type VARCHAR(50),
    quantity INT CHECK (quantity >= 0), -- Adding a check constraint for non-negative quantity
    unit_price DECIMAL(10,2),
    total_money DECIMAL(10,2) CHECK (total_money >= 0), -- Adding a check constraint for non-negative total_money
    
);

CREATE TABLE work (
    work_id INT PRIMARY KEY IDENTITY(1,1),
    type VARCHAR(50),
    item VARCHAR(100),
    metal_type VARCHAR(50),
    metal_weight DECIMAL(10, 2),
    unit VARCHAR(50),
    work_date DATE,
    worker_id INT,
    worker_name VARCHAR(100),
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id)
);

CREATE TABLE workers (
    worker_id INT PRIMARY KEY IDENTITY(1,1),
    workername NVARCHAR(100),
    workeraddress NVARCHAR(255),
    responsibility NVARCHAR(100),
    salary DECIMAL(10, 2) CHECK (salary >= 0), -- Adding a check constraint for non-negative salary
    joining_date DATE,
    phone NCHAR(11) UNIQUE,
    cnic NCHAR(15) UNIQUE
);
select * from workers

CREATE TABLE worker_salary (
    salary_id INT PRIMARY KEY IDENTITY(1,1),
    worker_id INT,
    pay_for VARCHAR(20),
    amount DECIMAL(10, 2) CHECK (amount >= 0), -- Adding a check constraint for non-negative amount
    payment_date DATE,
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id)
);
select * from worker_salary

CREATE TABLE worker (
    worker_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    password VARCHAR(255) UNIQUE
);

CREATE TABLE add_inventory (
    inventoryId INT PRIMARY KEY IDENTITY(1,1),
    purchaseDate DATE,
    type VARCHAR(255),
    goodsName VARCHAR(255),
    weight DECIMAL(10, 2) check (weight >0),
    price DECIMAL(10, 2) check (price >0),
    unit VARCHAR(50),
    distributorId INT unique,
);

CREATE TABLE return_work (
    return_id INT PRIMARY KEY IDENTITY(1,1),
    work_id INT,
    return_date DATE,
    return_weight DECIMAL(10,2) check (return_weight >0) ,
    item_weight DECIMAL(10,2) check (item_weight >0) ,
    pay_to_worker VARCHAR(3) ,
    money DECIMAL(10,2) check (money >0) ,
    FOREIGN KEY (work_id) REFERENCES work(work_id)
);
select * from return_work

CREATE TABLE polish_send (
    polish_id INT IDENTITY(1,1) PRIMARY KEY,
    date VARCHAR(50),
    weight DECIMAL(10,2) check (weight > 0),
    metal VARCHAR(255),
    item VARCHAR(255),
    unit VARCHAR(50),
    notes TEXT
);


CREATE TABLE polish_return (
    return_id INT IDENTITY(1,1) PRIMARY KEY,
    polish_id INT,
    return_date VARCHAR(50),
    return_weight DECIMAL(10,2) check (return_weight > 0),
    metal VARCHAR(255),
    item VARCHAR(255),
    unit VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (polish_id) REFERENCES polish_send(polish_id)
);

CREATE TABLE receipts (
    receipt_id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    name VARCHAR(255),
    phone VARCHAR(20) unique ,
    address VARCHAR(255),
    amount DECIMAL(10,2) check (amount > 0),
    quantity INT check (quantity > 0)
);

CREATE TABLE deleted_workers_detail(
    log_id INT PRIMARY KEY IDENTITY(1,1),
    worker_id INT,
    deleted_date DATETIME,
    workername NVARCHAR(100),
    workeraddress NVARCHAR(255),
    responsibility NVARCHAR(100),
    salary DECIMAL(10, 2),
    joining_date DATE,
    phone NCHAR(11),
    cnic NCHAR(15)
);



--data entries
INSERT INTO supplier (date, name, address, phone, item, type, quantity, unit_price, total_money)
VALUES 
('2024-04-01', 'Diamond Suppliers', '123 Jewel Street, Karachi', '0321-1234567', 'Diamonds', 'Gemstone', 50, 300.00, 15000.00),
('2024-04-02', 'Gold World', '456 Gold Avenue, Lahore', '0333-2345678', 'Gold Bars', 'Metal', 100, 500.00, 50000.00),
('2024-04-03', 'Silver Shine', '789 Silver Lane, Islamabad', '0344-3456789', 'Silver Chains', 'Metal', 80, 300.00, 24000.00),
('2024-04-04', 'Gemstone Traders', '210 Gemstone Street, Karachi', '0312-4567890', 'Emeralds', 'Gemstone', 30, 300.00, 9000.00),
('2024-04-05', 'Platinum Palace', '543 Platinum Boulevard, Lahore', '0335-5678901', 'Platinum Rings', 'Metal', 20, 1750.00, 35000.00),
('2024-04-06', 'Jewelry World', '987 Jewelry Avenue, Islamabad', '0321-6789012', 'Sapphires', 'Gemstone', 40, 300.00, 12000.00),
('2024-04-07', 'Diamond Delight', '321 Diamond Street, Karachi', '0344-7890123', 'Diamond Necklaces', 'Gemstone', 25, 720.00, 18000.00),
('2024-04-08', 'Gold & Gemstones', '654 Gold Lane, Lahore', '0333-8901234', 'Opals', 'Gemstone', 35, 300.00, 10500.00),
('2024-04-09', 'Silver Suppliers', '210 Silver Street, Islamabad', '0322-9012345', 'Silver Bracelets', 'Metal', 60, 300.00, 18000.00),
('2024-04-10', 'Ruby Rocks', '543 Ruby Avenue, Karachi', '0341-0123456', 'Rubies', 'Gemstone', 45, 300.00, 13500.00),
('2024-04-11', 'Gold Rush', '987 Gold Boulevard, Lahore', '0332-1234567', 'Gold Earrings', 'Metal', 75, 600.00, 45000.00),
('2024-04-12', 'Sapphire Sights', '321 Sapphire Street, Islamabad', '0321-2345678', 'Sapphires', 'Gemstone', 50, 400.00, 20000.00),
('2024-04-13', 'Platinum Plus', '654 Platinum Lane, Karachi', '0344-3456789', 'Platinum Chains', 'Metal', 40, 1500.00, 60000.00),
('2024-04-14', 'Diamond Dreams', '210 Diamond Avenue, Lahore', '0335-4567890', 'Diamond Bracelets', 'Gemstone', 30, 900.00, 27000.00),
('2024-04-15', 'Silver Styles', '543 Silver Street, Islamabad', '0322-5678901', 'Silver Rings', 'Metal', 55, 300.00, 16500.00),
('2024-04-16', 'Emerald Emporium', '987 Emerald Avenue, Karachi', '0333-6789012', 'Emerald Bracelets', 'Gemstone', 45, 300.00, 13500.00),
('2024-04-17', 'Gold Glimmer', '321 Gold Lane, Lahore', '0344-7890123', 'Gold Pendants', 'Metal', 65, 600.00, 39000.00),
('2024-04-18', 'Ruby Radiance', '654 Ruby Street, Islamabad', '0332-9012345', 'Ruby Necklaces', 'Gemstone', 25, 600.00, 15000.00),
('2024-04-19', 'Silver Sparkle', '210 Silver Avenue, Karachi', '0321-0123456', 'Silver Earrings', 'Metal', 70, 300.00, 21000.00),
('2024-04-20', 'Diamond Dynasty', '543 Diamond Lane, Lahore', '0341-1234567', 'Diamond Rings', 'Gemstone', 50, 800.00, 40000.00);


INSERT INTO workers (workername, workeraddress, responsibility, salary, joining_date, phone, cnic)
VALUES 
('Ali Khan', '123 Main Street, Lahore', 'Goldsmith', 25000.00, '2022-01-05', '03331234567', '123456789012345'),
('Sana Ahmed', '456 Pearl Avenue, Karachi', 'Gemstone Setting', 22000.00, '2022-02-10', '03212345678', '234567890123456'),
('Aamir Malik', '789 Silver Street, Islamabad', 'Engraving', 20000.00, '2022-03-15', '03123456789', '345678901234567'),
('Nadia Khan', '210 Gold Boulevard, Lahore', 'Polishing', 22000.00, '2022-04-20', '03444567890', '456789012345678'),
('Ahmed Raza', '543 Diamond Lane, Karachi', 'Designing', 28000.00, '2022-05-25', '03355678901', '567890123456789'),
('Saba Ali', '987 Platinum Street, Islamabad', 'Quality Control', 26000.00, '2022-06-30', '03116789012', '678901234567890'),
('Farhan Siddiqui', '654 Emerald Avenue, Lahore', 'Casting', 24000.00, '2022-07-05', '03327890123', '789012345678901'),
('Ayesha Raza', '210 Silver Boulevard, Karachi', 'Assembling', 22000.00, '2022-08-10', '03228901234', '890123456789012'),
('Zainab Ahmed', '789 Gold Street, Islamabad', 'Stone Cutting', 21000.00, '2022-09-15', '03419012345', '901234567890123'),
('Kamran Ali', '321 Ruby Lane, Lahore', 'Wax Carving', 23000.00, '2022-10-20', '03330123456', '012345678901234'),
('Saima Malik', '543 Sapphire Avenue, Karachi', 'Soldering', 20000.00, '2022-11-25', '03211234567', '123456789012344'), 
('Imran Khan', '987 Diamond Street, Islamabad', 'Finishing', 24000.00, '2022-12-30', '03442345678', '234567890123455'), 
('Zoya Raza', '654 Pearl Lane, Lahore', 'Welding', 23000.00, '2023-01-05', '03353456789', '345678901234566'),
('Asad Malik', '210 Silver Avenue, Karachi', 'Grinding', 22000.00, '2023-02-10', '03124567890', '456789012345677'), 
('Sadia Ahmed', '789 Gold Boulevard, Islamabad', 'Assembly Line', 25000.00, '2023-03-15', '03335678901', '567890123456788'), 
('Bilal Khan', '321 Diamond Street, Lahore', 'Jewelry Repair', 23000.00, '2023-04-20', '03216789012', '678901234567899'), 
('Ayesha Raza', '543 Ruby Avenue, Karachi', 'Stone Setting', 22000.00, '2023-05-25', '03447890123', '789012345678900'), 
('Sohaib Ali', '987 Emerald Lane, Islamabad', 'Casting', 24000.00, '2023-06-30', '03328901234', '890123456789011'), 
('Hina Malik', '210 Gold Street, Lahore', 'Polishing', 22000.00, '2023-07-05', '03229012345', '901234567890122'), 
('Aamna Khan', '543 Platinum Avenue, Karachi', 'Quality Control', 26000.00, '2023-08-10', '03410123456', '012345678901233');
select * from workers
-- Updated entries for the work table

INSERT INTO work (type, item, metal_type, metal_weight, unit, work_date, worker_id, worker_name)
VALUES 
('Ring', 'Gold Ring', '18K Gold', 5.2, 'Grams', '2022-01-05', 1, 'Ali Khan'),
('Necklace', 'Diamond Necklace', 'Platinum', 12.5, 'Grams', '2022-02-10', 2, 'Sana Ahmed'),
('Bracelet', 'Silver Bracelet', 'Sterling Silver', 8.3, 'Grams', '2022-03-15', 3, 'Aamir Malik'),
('Earrings', 'Ruby Earrings', 'White Gold', 4.8, 'Grams', '2022-04-20', 4, 'Nadia Khan'),
('Pendant', 'Emerald Pendant', 'Yellow Gold', 6.7, 'Grams', '2022-05-25', 5, 'Ahmed Raza'),
('Ring', 'Sapphire Ring', 'White Gold', 6.1, 'Grams', '2022-06-30', 6, 'Saba Ali'),
('Necklace', 'Pearl Necklace', 'Gold', 11.2, 'Grams', '2022-07-05', 7, 'Farhan Siddiqui'),
('Bracelet', 'Diamond Bracelet', 'Platinum', 9.8, 'Grams', '2022-08-10', 8, 'Ayesha Raza'),
('Earrings', 'Gold Earrings', 'Yellow Gold', 3.9, 'Grams', '2022-09-15', 9, 'Zainab Ahmed'),
('Pendant', 'Amethyst Pendant', 'Rose Gold', 5.5, 'Grams', '2022-10-20', 10, 'Kamran Ali'),
('Ring', 'Platinum Ring', 'Platinum', 7.3, 'Grams', '2022-11-25', 11, 'Saima Malik'),
('Necklace', 'Emerald Necklace', 'Gold', 13.1, 'Grams', '2022-12-30', 12, 'Imran Khan'),
('Bracelet', 'Ruby Bracelet', 'White Gold', 8.6, 'Grams', '2023-01-05', 13, 'Zoya Raza'),
('Earrings', 'Diamond Earrings', 'Yellow Gold', 4.2, 'Grams', '2023-02-10', 14, 'Asad Malik'),
('Pendant', 'Sapphire Pendant', 'White Gold', 7.8, 'Grams', '2023-03-15', 15, 'Sadia Ahmed'),
('Ring', 'Gold Ring', 'Yellow Gold', 6.5, 'Grams', '2023-04-20', 16, 'Bilal Khan'),
('Necklace', 'Diamond Necklace', 'Platinum', 15.2, 'Grams', '2023-05-25', 17, 'Ayesha Raza'),
('Bracelet', 'Silver Bracelet', 'Sterling Silver', 10.4, 'Grams', '2023-06-30', 18, 'Sohaib Ali'),
('Earrings', 'Gold Earrings', 'Yellow Gold', 3.4, 'Grams', '2023-07-05', 19, 'Hina Malik'),
('Pendant', 'Diamond Pendant', 'White Gold', 6.9, 'Grams', '2023-08-10', 20, 'Aamna Khan');
select * from work
-- Updated entries for the worker_salary table
INSERT INTO worker_salary (worker_id, pay_for, amount, payment_date)
VALUES 
(1, 'January', 2500.00, '2024-01-05'),
(2, 'February', 2800.00, '2024-02-05'),
(3, 'March', 2700.00, '2024-03-05'),
(4, 'April', 2600.00, '2024-04-05'),
(5, 'May', 3000.00, '2024-05-05'),
(6, 'June', 2900.00, '2024-06-05'),
(7, 'July', 3100.00, '2024-07-05'),
(8, 'August', 3200.00, '2024-08-05'),
(9, 'September', 2700.00, '2024-09-05'),
(10, 'October', 2500.00, '2024-10-05'),
(11, 'November', 2800.00, '2024-11-05'),
(12, 'December', 2600.00, '2024-12-05'),
(13, 'January', 2900.00, '2025-01-05'),
(14, 'February', 3000.00, '2025-02-05'),
(15, 'March', 3100.00, '2025-03-05'),
(16, 'April', 3200.00, '2025-04-05'),
(17, 'May', 2700.00, '2025-05-05'),
(18, 'June', 2500.00, '2025-06-05'),
(19, 'July', 2800.00, '2025-07-05'),
(20, 'August', 2600.00, '2025-08-05');


INSERT INTO worker (username, password)
VALUES 
('user1', 'password1'),
('user2', 'password2'),
('user3', 'password3'),
('user4', 'password4'),
('user5', 'password5'),
('user6', 'password6'),
('user7', 'password7'),
('user8', 'password8'),
('user9', 'password9'),
('user10', 'password10'),
('user11', 'password11'),
('user12', 'password12'),
('user13', 'password13'),
('user14', 'password14'),
('user15', 'password15'),
('user16', 'password16'),
('user17', 'password17'),
('user18', 'password18'),
('user19', 'password19'),
('user20', 'password20');

INSERT INTO add_inventory (purchaseDate, type, goodsName, weight, price, unit, distributorId) 
VALUES 
('2023-04-05', 'Gold', 'Gold Necklace', 0.1, 50000.00, 'g', 104),
('2023-05-10', 'Gold', 'Gold Bracelet', 50, 8000.00, 'g', 105),
('2023-06-15', 'Silver', 'Silver Earrings', 20, 1500.00, 'mg', 106),
('2023-07-20', 'Gold', 'Ruby Ring', 30, 10000.00, 'mg', 107),
('2023-08-25', 'Silver', 'Emerald Pendant', 40, 12000.00, 'mg', 108),
('2023-09-30', 'Gold', 'Sapphire Brooch', 20, 7000.00, 'mg', 109),
('2023-10-05', 'Gold', 'Pearl Necklace', 100, 20000.00, 'mg', 110),
('2023-11-10', 'Gold', 'Diamond Studs', 10, 25000.00, 'mg', 111),
('2023-12-15', 'Silver', 'Silver Chain', 100, 18000.00, 'mg', 112),
('2024-01-20', 'Platinum', 'Platinum Ring', 20, 30000.00, 'mg', 113),
('2024-02-25', 'Gold', 'Gold Watch', 80, 35000.00, 'mg', 114),
('2024-03-30', 'Silver', 'Silver Bangle', 30, 5000.00, 'mg', 115),
('2024-04-05', 'Gold', 'Gold Anklet', 40, 10000.00, 'mg', 116),
('2024-05-10', 'Silver', 'Silver Ring', 50, 8000.00, 'mg', 117),
('2024-06-15', 'Gold', 'Gold Pendant', 30, 12000.00, 'mg', 118),
('2024-07-20', 'Silver', 'Silver Necklace', 100, 20000.00, 'mg', 119),
('2024-08-25', 'Gold', 'Gold Earrings', 20, 15000.00, 'mg', 120),
('2024-09-30', 'Platinum', 'Platinum Bracelet', 50, 25000.00, 'mg', 121),
('2024-10-15', 'Gold', 'Gold Ring', 30, 18000.00, 'mg', 122),
('2024-11-20', 'Silver', 'Silver Pendant', 20, 10000.00, 'mg', 123);

INSERT INTO return_work (work_id, return_date, return_weight, item_weight, pay_to_worker, money) 
VALUES 
(21, '2022-01-05', 1.2, 1.0, 'Yes', 2000.00),
(22, '2022-02-10', 0.8, 0.7, 'No', 1500.00),
(3, '2022-03-15', 1.5, 1.3, 'Yes', 1800.00),
(4, '2022-014-20', 0.7, 0.5, 'Yes', 1200.00),
(5, '2022-05-25', 1.0, 0.9, 'No', 1600.00),
(6, '2022-06-30', 1.3, 1.1, 'Yes', 1900.00),
(7, '2022-07-05', 0.6, 0.5, 'Yes', 1300.00),
(8, '2022-08-10', 0.9, 0.8, 'No', 1700.00),
(9, '2022-09-15', 1.1, 0.9, 'Yes', 1800.00),
(10, '2022-10-20', 0.5, 0.4, 'Yes', 1400.00),
(11, '2022-11-25', 1.4, 1.2, 'No', 1700.00),
(12, '2022-12-30', 0.8, 0.7, 'Yes', 1500.00),
(13, '2023-01-05', 1.3, 1.1, 'Yes', 1800.00),
(14, '2023-02-10', 0.6, 0.5, 'No', 1300.00),
(15, '2023-03-15', 0.9, 0.8, 'Yes', 1600.00),
(16, '2023-04-20', 1.2, 1.0, 'Yes', 1900.00),
(17, '2023-05-25', 0.7, 0.6, 'No', 1400.00),
(18, '2023-06-30', 1.0, 0.9, 'Yes', 1700.00),
(19, '2023-07-05', 1.3, 1.1, 'Yes', 1800.00),
(20, '2023-08-10', 0.5, 0.4, 'No', 1300.00);
select * from return_work
INSERT INTO polish_send (date, weight, metal, item, unit, notes) 
VALUES 
('2023-01-15', 1.8, 'Gold', 'Ring', 'pcs', 'Customer order'),
('2023-02-20', 0.5, 'Silver', 'Necklace', 'pcs', 'Gift for anniversary'),
('2023-03-10', 2.3, 'Platinum', 'Bracelet', 'pcs', 'Special occasion'),
('2023-04-05', 0.8, 'Gold', 'Earrings', 'pcs', 'New collection'),
('2023-05-10', 1.2, 'Silver', 'Ring', 'pcs', 'Custom design'),
('2023-06-15', 1.5, 'Gold', 'Necklace', 'pcs', 'Anniversary gift'),
('2023-07-20', 0.7, 'Platinum', 'Pendant', 'pcs', 'Birthday present'),
('2023-08-25', 0.4, 'Silver', 'Bracelet', 'pcs', 'Valentine gift'),
('2023-09-30', 1.0, 'Gold', 'Anklet', 'pcs', 'Wedding anniversary'),
('2023-10-05', 0.3, 'Platinum', 'Ring', 'pcs', 'Engagement ring'),
('2023-11-10', 1.8, 'Silver', 'Earrings', 'pcs', 'Mothers day gift'),
('2023-12-15', 2.5, 'Gold', 'Bracelet', 'pcs', 'Christmas gift'),
('2024-01-20', 0.6, 'Silver', 'Pendant', 'pcs', 'Graduation present'),
('2024-02-25', 1.3, 'Gold', 'Ring', 'pcs', 'Promotion celebration'),
('2024-03-30', 0.9, 'Silver', 'Necklace', 'pcs', 'Just because gift'),
('2024-04-05', 2.0, 'Gold', 'Earrings', 'pcs', 'Achievement reward'),
('2024-05-10', 0.5, 'Platinum', 'Bracelet', 'pcs', 'Job promotion gift'),
('2024-06-15', 1.7, 'Silver', 'Ring', 'pcs', 'Anniversary celebration'),
('2024-07-20', 0.2, 'Gold', 'Pendant', 'pcs', 'Friendship day gift'),
('2024-08-25', 1.1, 'Silver', 'Earrings', 'pcs', 'Thanksgiving present');


INSERT INTO polish_return (polish_id, return_date, return_weight, metal, item, unit, notes) 
VALUES 
(1, '2023-01-20', 1.8, 'Gold', 'Ring', 'pcs', 'Slight scratches observed'),
(2, '2023-02-05', 0.5, 'Silver', 'Necklace', 'pcs', 'Customer dissatisfaction'),
(3, '2023-03-15', 2.3, 'Platinum', 'Bracelet', 'pcs', 'Return due to size issue'),
(4, '2023-04-10', 0.8, 'Gold', 'Earrings', 'pcs', 'Change of mind'),
(5, '2023-05-25', 1.2, 'Silver', 'Ring', 'pcs', 'Defective clasp'),
(6, '2023-06-15', 1.5, 'Gold', 'Necklace', 'pcs', 'Received wrong item'),
(7, '2023-07-20', 0.7, 'Platinum', 'Pendant', 'pcs', 'Gift return'),
(8, '2023-08-05', 0.4, 'Silver', 'Bracelet', 'pcs', 'Not as described'),
(9, '2023-09-10', 1.0, 'Gold', 'Anklet', 'pcs', 'Customer dissatisfaction'),
(10, '2023-10-15', 0.3, 'Platinum', 'Ring', 'pcs', 'Size issue'),
(11, '2023-11-20', 1.8, 'Silver', 'Earrings', 'pcs', 'Allergic reaction'),
(12, '2023-12-25', 2.5, 'Gold', 'Bracelet', 'pcs', 'Damaged during shipping'),
(13, '2024-01-30', 0.6, 'Silver', 'Pendant', 'pcs', 'Gift exchange'),
(14, '2024-02-10', 1.3, 'Gold', 'Ring', 'pcs', 'Change of mind'),
(15, '2024-03-20', 0.9, 'Silver', 'Necklace', 'pcs', 'Defective chain'),
(16, '2024-04-05', 2.0, 'Gold', 'Earrings', 'pcs', 'Received duplicate item'),
(17, '2024-05-10', 0.5, 'Platinum', 'Bracelet', 'pcs', 'Incorrect size'),
(18, '2024-06-15', 1.7, 'Silver', 'Ring', 'pcs', 'Not as expected'),
(19, '2024-07-20', 0.2, 'Gold', 'Pendant', 'pcs', 'Customer changed mind'),
(20, '2024-08-25', 1.1, 'Silver', 'Earrings', 'pcs', 'Gift return');

INSERT INTO receipts (date, name, phone, address, amount, quantity) 
VALUES 
('2023-01-01', 'Ahmed Khan', '1234567890', '123 Main St, Karachi', 1500.00, 2),
('2023-02-02', 'Fatima Ali', '2345678901', '456 Elm St, Lahore', 2500.00, 1),
('2023-03-03', 'Mohammad Hassan', '3456789013', '789 Oak St, Islamabad', 3000.00, 3), 
('2023-04-04', 'Ayesha Ahmed', '4567890123', '987 Pine St, Karachi', 1800.00, 2),
('2023-05-05', 'Ali Raza', '5678901444', '654 Maple St, Lahore', 5000.00, 1),
('2023-06-06', 'Sana Khan', '6789012345', '321 Birch St, Islamabad', 3500.00, 4),
('2023-07-07', 'Yasir Mahmood', '7890123456', '876 Cedar St, Karachi', 2000.00, 1),
('2023-08-08', 'Amir Malik', '8901234567', '543 Walnut St, Lahore', 2800.00, 3),
('2023-09-09', 'Zoya Shah', '9012345678', '210 Pine St, Islamabad', 4000.00, 2),
('2023-10-10', 'Aisha Rehman', '0003456789', '135 Elm St, Karachi', 2200.00, 1),
('2023-11-11', 'Rizwan Ali', '1234509876', '567 Oak St, Lahore', 1500.00, 2),
('2023-12-12', 'Nadia Khan', '234567321', '876 Maple St, Islamabad', 2700.00, 1),
('2024-01-01', 'Usman Ahmed', '3456789012', '987 Pine St, Karachi', 1900.00, 3), 
('2024-02-02', 'Maria Fatima', '4567890999', '654 Cedar St, Lahore', 3500.00, 2),
('2024-03-03', 'Kamran Khan', '5678901234', '321 Elm St, Islamabad', 4000.00, 1),
('2024-04-04', 'Sadia Ali', '6889012345', '876 Pine St, Karachi', 2400.00, 2),
('2024-05-05', 'Bilal Raza', '7800123456', '543 Maple St, Lahore', 1800.00, 1),
('2024-06-06', 'Nida Sana', '8901234555', '210 Cedar St, Islamabad', 3200.00, 3),
('2024-07-07', 'Ahmed Yasir', '9012348718', '135 Birch St, Karachi', 2600.00, 2),
('2024-08-08', 'Sara Malik', '0123456789', '567 Oak St, Lahore', 2800.00, 1);


--views 

CREATE VIEW supplier_view AS
SELECT supplier_no, date, name, item, type, quantity, total_money
FROM supplier;

CREATE VIEW workers_view AS 
SELECT worker_id, workername, responsibility
FROM workers;

CREATE VIEW worker_salary_view AS 
SELECT  worker_id, pay_for,amount, payment_date 
FROM worker_salary;

CREATE VIEW worker_view AS 
SELECT worker_id, username
FROM worker;

CREATE VIEW add_inventory_view AS 
SELECT inventoryId ,purchaseDate ,type,goodsName ,weight ,price ,unit
FROM add_inventory;

CREATE VIEW polish_send_view AS 
SELECT polish_id , date ,item ,unit ,notes
FROM polish_send;

CREATE VIEW polish_return_view AS 
SELECT return_id, return_date, return_weight, unit, notes
FROM polish_return;

CREATE VIEW receipts_view AS 
SELECT receipt_id, date, name, address,  quantity
FROM receipts;

CREATE VIEW return_work_view AS 
SELECT return_id,work_id, return_date, return_weight, item_weight
FROM return_work;

CREATE VIEW work_view AS 
SELECT work_id, item, metal_type, metal_weight,worker_id, worker_name 
FROM work;

--view through joins

CREATE VIEW work_details AS 
SELECT work.work_id,work.item,work.metal_weight,work.worker_name,work.worker_id,return_work.return_weight,return_work.return_date
FROM work 
FULL OUTER JOIN return_work ON work.work_id=return_work.work_id

select * from work_details


CREATE VIEW polish_send_return_view AS
SELECT polish_send.polish_id,polish_send.date,polish_send.weight,polish_send.item,
polish_return.return_id,polish_return.return_date,polish_return.return_weight
from polish_send 
inner join polish_return ON polish_send.polish_id=polish_return.polish_id;

select * from  polish_send_return_view

CREATE VIEW salary_per_month AS
SELECT workers.worker_id,workers.workername,worker_salary.pay_for,worker_salary.amount,worker_salary.payment_date
FROM workers
inner join worker_salary ON workers.worker_id=worker_salary.worker_id
where worker_salary.pay_for='January'

select * from salary_per_month

--TRIGGERS

--SUPPLIER


--update

CREATE TRIGGER update_total_money
ON supplier
AFTER  UPDATE
AS
BEGIN
 IF UPDATE(quantity)
   BEGIN
    UPDATE supplier
    SET total_money = quantity * unit_price
	SELECT * FROM supplier;
    END;
END ;

drop trigger update_total_money
update supplier set quantity=11 where supplier_no=3
delete from supplier where supplier_no=3
select * from supplier

--insert
create trigger insert_supplier 
on supplier for  insert as
begin
print('Inserted Successfully')
select * from inserted
end

--workers
--insert update
CREATE TRIGGER increase_salary_trigger
ON workers
AFTER INSERT, UPDATE
AS
  BEGIN
       UPDATE workers
       SET salary = salary * 1.05 -- Increase salary by 5%
       WHERE DATEDIFF(YEAR, workers.joining_date, GETDATE()) >= 5 
  END;

drop trigger increase_salary_trigger
select * from workers

INSERT INTO workers (workername, workeraddress, responsibility, salary, joining_date, phone, cnic)
VALUES 
('Ali Khan', '123 Main Street, Lahore', 'Goldsmith', 25000.00, '2015-01-05', '02336234567', '123455779012345')
delete from workers where worker_id=43
--delete

CREATE TRIGGER delete_worker_trigger
ON workers
AFTER DELETE
AS
   BEGIN
       INSERT INTO deleted_workers_detail(worker_id, deleted_date, workername, workeraddress, responsibility, salary, joining_date, phone, cnic)
       SELECT worker_id, GETDATE(), workername, workeraddress, responsibility, salary, joining_date, phone, cnic
       FROM deleted;
   END

select * from deleted_workers_detail

drop trigger delete_worker_trigger
--worker_salary 
--insert update

create trigger tax_salary
on worker_salary
after insert,update
as
  begin
        update worker_salary set amount=amount *0.98
        where amount >= 50000
  end;
update worker_salary set amount =60000 where worker_id=24
select * from worker_salary

--work
--insert
CREATE TRIGGER trg_work_insert
ON work
AFTER INSERT
AS
BEGIN

    SELECT work.work_id,work.type,work.worker_name,work.work_date
    FROM work
    LEFT JOIN return_work ON work.work_id = return_work.work_id
    WHERE return_work.work_id IS NULL;
	PRINT 'ACTIVE WORK';
END;

drop trigger trg_work_insert
INSERT INTO work (type, item, metal_type, metal_weight, unit, work_date, worker_id, worker_name)
VALUES 
('Ring', 'Gold Ring', '18K Gold', 5.2, 'Grams', '2022-01-05', 2, 'Ali Khan')

--update

CREATE TRIGGER trg_update_work
ON work
AFTER update
AS
BEGIN
  select metal_type,count(metal_type) as number_of_items ,avg(metal_weight)as average_weight
  from work
  group by metal_type

end
drop trigger trg_update_work
update work set type='silver' where work_id=3

--worker
--insert
CREATE TRIGGER trg_after_insert_worker
ON worker
AFTER INSERT
AS
BEGIN
    select count(worker_id) AS total_users_registerd
	from worker 
END;
drop trigger trg_after_insert_worker
INSERT INTO worker (username, password)
VALUES 
('user23', 'password23')

select * from worker

CREATE TRIGGER trg_after_update_worker
ON worker
AFTER UPDATE
AS
BEGIN
    IF UPDATE(username)
	 BEGIN
	 select username from worker where username like 'u%2_'
	 END
END;
drop trigger trg_after_insert_worker


update worker set username='user24' where worker_id=23;

--add inventory


CREATE TRIGGER insert_inventory_trigger 
ON add_inventory   --insert trigger on add_inventory table
AFTER INSERT AS
BEGIN
    SELECT type, COUNT(type) AS TotalItems
    FROM add_inventory
    GROUP BY type;
END;

 drop trigger   insert_inventory_trigger;

 INSERT INTO add_inventory (purchaseDate, type, goodsName, weight, price, unit, distributorId) 
VALUES 
('2023-03-06', 'Gold', 'Gold Necklace', 54, 500.00, 'kg', 103)

delete from   add_inventory where distributorId=103;




CREATE TRIGGER update_inventory_triggers ON add_inventory --update trigger on add_inventory table
AFTER UPDATE
AS
BEGIN
    IF UPDATE(weight)
    BEGIN
        UPDATE add_inventory
        SET price = price * 1.10 --add 10%
        WHERE weight > 50 AND unit = 'kg';
    --    SELECT * FROM add_inventory; 
    END;
END ; 

update add_inventory set weight=60  where distributorId=122;

 drop trigger  update_inventory_triggers;




CREATE TRIGGER delete_inventory_triggers ON add_inventory  --delete trigger on add_inventory table
 AFTER  DELETE AS
 BEGIN
      print('Deleted Records :')
      select * from deleted;
 END

 delete from add_inventory where distributorId=103;
 --polish return

 CREATE TRIGGER insert_polish_return on polish_return  --insert trigger on polish_return
 AFTER INSERT AS
 BEGIN
 select polish_return.return_id,polish_return.return_date,polish_return.return_weight,polish_send.polish_id,
 polish_send.date,polish_send.weight  FROM polish_return
 INNER JOIN polish_send on polish_return.polish_id=polish_send.polish_id;
 END

 INSERT INTO polish_return (polish_id, return_date, return_weight, metal, item, unit, notes) 
VALUES 
(1, '2023-01-20', 1.8, 'Gold', 'Ring', 'pcs', 'Slight scratches observed');




CREATE TRIGGER update_polish_return on polish_return  --update trigger on polish_return
 AFTER UPDATE AS
 BEGIN
     IF UPDATE(item)
	 BEGIN
	   SELECT DISTINCT(item) from polish_return;
	 END;
 END;

 update polish_return set item='Ring' where polish_id=7;
 --polish send

 CREATE TRIGGER insert_update_polish_send  ON polish_send -- insert and update trigger on polish send
 AFTER INSERT ,UPDATE AS
 BEGIN
  PRINT 'Work present  only in polish_send table:';
 SELECT polish_send.polish_id,polish_send.date,polish_send.weight,
 polish_return.polish_id,polish_return.return_id,polish_return.return_weight from polish_send
 LEFT OUTER JOIN polish_return ON polish_send.polish_id=polish_return.polish_id
 END

 update polish_send set notes='The set is send for polish' where date='2023-11-20';

 drop trigger insert_update_polish_send;


 --receipt

 CREATE TRIGGER insert_recipt ON receipts  --insert trigger on recipt
 AFTER INSERT AS
 BEGIN
 select SUM(amount) AS TOTAL_AMOUNT, COUNT(receipt_id) AS TOTAL_RECIPTS
 from receipts;
 END

 INSERT INTO receipts (date, name, phone, address, amount, quantity) 
VALUES 
('2024-03-10', 'Ahmed ali', '3334042600', '123 Main St, Lahore', 5500.00, 2)

delete from receipts where phone='3021492100'




CREATE TRIGGER insert_update_receipt ON receipts   --insert and update trigger on receipts
AFTER UPDATE,INSERT
AS
BEGIN
        UPDATE receipts
        SET amount = inserted.amount * 0.98
        FROM inserted
        WHERE inserted.receipt_id = receipts.receipt_id
        AND inserted.amount > 4500;
END;

update receipts set quantity=3 where phone='0123456789'

drop trigger insert_update_receipt;

select * from receipts
--return work

 CREATE TRIGGER insert_return_work ON return_work --insert trigger on return_work
 AFTER INSERT AS
 BEGIN
 select return_work.return_id,return_work.return_date,return_work.return_weight,
 work.work_id,work.work_date,work.metal_weight, work.worker_name  FROM   return_work
 INNER JOIN  work on return_work.work_id=work.work_id
 END

 drop trigger insert_return_work

 INSERT INTO return_work (work_id, return_date, return_weight, item_weight, pay_to_worker, money) 
VALUES 
(20, '2022-02-05', 5.0, 4.0, 'Yes', 2300.00);

delete from return_work where money=2300
select * from return_work;


CREATE TRIGGER update_return_work ON return_work  --update return work trigger
AFTER UPDATE
AS
BEGIN
   -- IF UPDATE(pay_to_worker)
    BEGIN
        SELECT pay_to_worker, COUNT(pay_to_worker) AS PAYMENT
        FROM return_work
        GROUP BY pay_to_worker;
    END;
END;

drop trigger update_return_work

update return_work set money=3000 where return_id=1;

select * from add_inventory
select * from deleted_workers_detail
select * from polish_return
select * from polish_send
select * from receipts
select * from return_work
select * from supplier
select * from work
select * from worker
select * from worker_salary
select * from workers