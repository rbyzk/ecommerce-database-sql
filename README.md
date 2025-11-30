# 🛒 E-Commerce Relational Database – SQL

This project designs and implements a relational e-commerce database using SQL-based tools.  
It includes **database schema creation (DDL)**, **sample data insertion (DML)**, **validation queries**, and an **ER diagram**.  
A full **technical report** is provided to explain the database structure, relationships, and business logic.

---

## 📝 Project Overview

The goal of this project is to simulate an **e-commerce database** scenario, build the **tables**, populate them with **sample data**, and validate the relationships through **SELECT** and **JOIN** queries.

The project covers:
- **Database schema design** with primary & foreign keys
- **Sample dataset population** for customers, products, orders, and payments
- **Validation queries** to test table relationships
- **ER diagram** to visualize database architecture

---

## 📂 Project Structure

```
ecommerce-database-sql/
├── scripts/
│ └── ecommerce_project.sql
├── diagrams/
│ └── er_diagram.png
├── reports/
│ ├── E-Commerce Database – Technical Report.pdf
│ └── E-Ticaret Veritabanı – Teknik Rapor.pdf
└── README.md
```

---

## 🗄️ Database Schema Overview

The database consists of **six main tables**:

| **Table**       | **Description**                                         |
|------------------|-------------------------------------------------------|
| **Customers**    | Stores customer details (name, email, city)            |
| **Orders**       | Stores customer orders and links to `Customers`        |
| **Products**     | Stores product names, prices, and category IDs         |
| **Categories**   | Defines product categories                            |
| **Payments**     | Stores payment details linked 1:1 with `Orders`        |
| **OrderItems**   | Bridge table creating an M:N relationship between `Orders` and `Products` |

**Key Relationships:**
- `Customers (1) → Orders (N)`
- `Orders (1) → Payments (1)`
- `Categories (1) → Products (N)`
- `Orders (M) ↔ Products (M)` via `OrderItems`

---

## ✅ Features

- **Normalized relational schema** with PK/FK constraints
- **Sample dataset** for testing
- **Validation queries** to confirm 1:N and M:N relationships
- **ER diagram** for visual understanding
- **Technical documentation** provided in both English and Turkish

---

## 👩‍💻 About Me

I'm **Beyza Küçük** — a **Data Scientist** and **Database Designer** passionate about building structured, efficient, and optimized **relational databases**.  

This project demonstrates my ability to design **scalable database architectures** and validate them through **queries and diagrams**.

---

## 🌐 Connect with Me

- **GitHub:** [github.com/rbyzk](https://github.com/rbyzk)
- **Kaggle:** [kaggle.com/beyzakucuk](https://www.kaggle.com/beyzakucuk)

✨ If you find this repository helpful, **give it a ⭐** and share it with others!

---

## 📜 License


This project is licensed under the **MIT License**.  
See the [LICENSE](./LICENSE) file for more details.
