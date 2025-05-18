# 📈 Superstore Sales Analysis Dashboard

A complete end-to-end business intelligence project showcasing data cleaning, modeling, analysis, and visualization using **Excel**, **MySQL**, **Python**, and **Power BI**.

---

## 🔍 Project Overview

This project uses the Superstore dataset to simulate real-world retail data analysis. The primary goal was to extract actionable business insights on:

* Sales performance
* Profit drivers and loss contributors
* Customer segmentation
* Discount impact
* Shipping efficiency

---

## 🛠️ Data Cleaning & Preparation

* **Excel Power Query** was used to clean and format the dataset.

  * Standardized decimal columns to 2 decimal places.
  * Fixed inconsistent date formats and ensured proper `Date` types.
  * Removed duplicates and handled missing data.
* **Created dimension tables**:

  * **Customers Table**: Unique customer information
  * **Products Table**: Cleaned list of products and categories
  * **Orders Table**: Fact table with transactional data

---

## 📊 Power BI Dashboard Design

The dashboard is split into three key pages for clarity and efficient storytelling:

### 1. **Sales Overview**

* KPIs: Total Sales, Total Profit, Number of Orders, Unique Customers
* Sales trends over time
* Category-wise and Sub-category performance

### 2. **Customer & Product Insights**

* Segment performance
* Top and bottom performing customers and products
* Highlighted negative profit products using conditional formatting

### 3. **Shipping & Discounts**

* Effect of discount levels on profit
* Shipping delay analysis (difference between order and ship dates)
* Shipping mode performance

---

## 🔬 Tools & Technologies

* **Excel** (Power Query Editor)
* **MySQL**: Structured the cleaned data into relational tables, queried for insights
* **Power BI**: Built interactive dashboards with slicers, cards, tables, and DAX measures

---

## 📅 DAX Measures Used

* `Loss Orders = CALCULATE(COUNTROWS('Superstore Cleaned Dataset'),'Superstore Cleaned Dataset'[Profit] < 0)`
* `Total Loss = CALCULATE(SUM('Superstore Cleaned Dataset'[Profit]),'Superstore Cleaned Dataset'[Profit] < 0)`

---

## 📂 Folder Structure

```
project-root/
├── data/
│   ├── raw/
│   └── cleaned/
├── scripts/
│   └── Queries
├── reports and visualizations/
│   ├── Superstore.pbix
│   └── Superstore_Dashboard.pdf
├── README.md
```

---

## 🔗 Output

* Cleaned and structured CSVs in the `cleaned/` folder
* Power BI Dashboard (PDF version)
* SQL queries used for insight generation available in `scripts/`

---

## 🌟 Lessons Learned

* Clean data models enhance visual efficiency
* Separate visuals into pages for improved clarity
* Simpler dashboards often communicate better

---

## 🔍 Explore More

* [\[Link to LinkedIn post] (https://www.linkedin.com/feed/update/urn:li:share:7329919038158008321/)]


