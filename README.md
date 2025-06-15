# 💍 Jewelry Management System (JMS) Database

A structured relational database designed for managing a jewelry business — including suppliers, workers, work orders, inventory, polishing services, and sales.

## 🗂️ Overview
This database streamlines operations for the **Keep Smiling Jewelry Store**, enabling efficient tracking of:

- Supplier records
- Worker details & salaries
- Jewelry inventory
- Work and return orders
- Polishing services
- Customer receipts & sales

## 🧩 Core Tables
- `supplier` – Material providers
- `workers` – Worker info with login & salary
- `work`, `return_work` – Production orders
- `add_inventory` – Product listings
- `polish_send`, `polish_return` – Polishing workflow
- `receipts` – Sales records

## 🔐 Key Features
- **Constraints**: Auto-increment IDs, unique CNIC/phone, valid quantities & amounts  
- **Relationships**: Foreign keys between workers, work, returns, polishing, and salaries  
- **Triggers**: Auto-update salary, archive deleted workers, calculate totals and discounts  
- **Views**: Simplified reporting for suppliers, work details, polish records, monthly salary

## 📦 Sample Data
Includes 20 entries per major table (suppliers, workers, work, receipts, etc.)

## ⚙️ Setup Instructions
```sql
CREATE DATABASE JMS_database;
-- Then run the provided SQL script to create tables, insert sample data, views, and triggers
