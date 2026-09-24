# 🛒 MiniMart — SQL Sales & Inventory Management System

A beginner-friendly SQL database project built to practice **CRUD operations, filtering, aggregation, joins, and subqueries** using PostgreSQL.

The goal of this project is not to build a complex application, but to understand how a relational database works through a small real-world business scenario.

## 🎯 Project Goal

Build a small sales and inventory management database for a store.

The system manages:

* Customers
* Product categories
* Products
* Orders
* Order items

This project is designed around the SQL concepts I am currently learning and practicing.

## 🧠 SQL Concepts Practiced

### Basic SQL

* SELECT
* WHERE
* AND / OR
* IN
* BETWEEN
* LIKE / ILIKE
* ORDER BY
* LIMIT

### CRUD

* INSERT
* SELECT
* UPDATE
* DELETE

### Aggregation

* COUNT
* SUM
* AVG
* MIN
* MAX
* GROUP BY
* HAVING

### Joins

* INNER JOIN
* Multiple-table joins

### Subqueries

* Scalar subqueries
* Subqueries with aggregate functions
* Comparing values against calculated results

## 🗃️ Database Structure

```text
Customers
   │
   │ 1 ──── many
   ▼
Orders
   │
   │ 1 ──── many
   ▼
Order_Items
   ▲
   │ many
   │
   │ many
Products ──── 1 Categories
```

## 📊 Tables

### Customers

| Column      | Description           |
| ----------- | --------------------- |
| customer_id | Unique customer ID    |
| full_name   | Customer name         |
| email       | Customer email        |
| phone       | Customer phone        |
| city        | Customer city         |
| created_at  | Account creation date |

### Categories

| Column        | Description        |
| ------------- | ------------------ |
| category_id   | Unique category ID |
| category_name | Category name      |

### Products

| Column       | Description           |
| ------------ | --------------------- |
| product_id   | Unique product ID     |
| category_id  | Product category      |
| product_name | Product name          |
| price        | Current product price |
| stock        | Available quantity    |
| created_at   | Product creation date |

### Orders

| Column      | Description                   |
| ----------- | ----------------------------- |
| order_id    | Unique order ID               |
| customer_id | Customer who placed the order |
| order_date  | Date of the order             |
| status      | Order status                  |

### Order Items

| Column        | Description                   |
| ------------- | ----------------------------- |
| order_item_id | Unique order item ID          |
| order_id      | Related order                 |
| product_id    | Purchased product             |
| quantity      | Quantity purchased            |
| unit_price    | Price at the time of purchase |

## 📁 Project Structure

```text
MiniMart-SQL/
│
├── README.md
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_crud.sql
│   ├── 04_basic_queries.sql
│   ├── 05_aggregation.sql
│   ├── 06_joins.sql
│   └── 07_subqueries.sql
│
└── diagram/
    └── database-schema.png
```

## 🚀 Learning Workflow

The project will be developed in this order:

```text
Design Database
      ↓
Create Tables
      ↓
Insert Sample Data
      ↓
Practice CRUD
      ↓
Basic Queries
      ↓
Aggregation
      ↓
JOIN
      ↓
Subqueries
      ↓
Testing
      ↓
Deploy PostgreSQL Database
```

## 🔎 Example Questions

The project should be able to answer questions such as:

* How many products are available?
* Which products are low in stock?
* What is the average product price?
* How many products belong to each category?
* How many orders has each customer placed?
* How much has each customer spent?
* Which customers have never placed an order?
* Which products are more expensive than the average product?
* Which products have never been ordered?

## 🛠️ Technology

* PostgreSQL
* SQL
* pgAdmin / DBeaver
* Git
* GitHub

## 📌 Current Learning Focus

This project intentionally focuses on foundational SQL.

Advanced SQL features such as:

* CTEs
* Window Functions
* Stored Procedures
* Triggers
* Advanced indexing
* Database optimization

will be explored separately after completing the core project.

## 🎓 Project Objective

The main objective is to move from:

> "I know SQL syntax"

to:

> "I can design a small relational database and use SQL to solve real problems."

---

Built as part of my journey to become a better **Data Analyst / Data Professional**.
