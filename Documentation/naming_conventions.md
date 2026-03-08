# Database Naming Conventions

This document outlines the standard naming conventions for the database architecture, ensuring consistency across Bronze, Silver, and Gold layers of the data warehouse.

---

## General Principles
* **Naming Conventions**: We use lowercase letters and underscores (`_`) to separate words.
* **Language**: Use English for all names.

---

## Table Naming Conventions

### Bronze Rules
* All names must start with the source system name, and table names must match their original names without renaming.
* **Pattern**: `<sourcesystem>_<entity>`.
    * `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
    * `<entity>`: Exact table name from the source system.
    * **Example**: `crm_customer_info` $\rightarrow$ Customer information from the CRM system.

### Silver Rules
* All names must start with the source system name, and table names must match their original names without renaming (Same as in Bronze layer).
* **Pattern**: `<sourcesystem>_<entity>`.
    * `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
    * `<entity>`: Exact table name from the source system.
    * **Example**: `crm_customer_info` $\rightarrow$ Customer information from the CRM system.

### Gold Rules
* All names must use meaningful, business-aligned names for tables, starting with the category prefix.
* **Pattern**: `<category>_<entity>`.
    * `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).
    * `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).
    * **Examples**:
        * `dim_customers` $\rightarrow$ Dimension table for customer data.
        * `fact_sales` $\rightarrow$ Fact table containing sales transactions.

#### Glossary of Category Patterns
| Pattern | Meaning | Example(s) |
| :--- | :--- | :--- |
| `dim_` | Dimension table | `dim_customer`, `dim_product` |
| `fact_` | Fact table | `fact_sales` |
| `agg_` | Aggregated table | `agg_customers`, `agg_sales_monthly` |

---

## Column Naming Conventions

### Surrogate Keys
* All primary keys in dimension tables must use the suffix `_key`.
* **Pattern**: `<table_name>_key`.
    * `<table_name>`: Refers to the name of the table or entity the key belongs to.
    * `_key`: The suffix indicating that this column is a surrogate key.
    * **Example**: `customer_key` $\rightarrow$ Surrogate key in the `dim_customers` table.

### Technical Columns
* All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
* **Pattern**: `dwh_<column_name>`.
    * `dwh_`: Prefix exclusively for system-generated metadata.
    * `<column_name>`: Descriptive name indicating the column's purpose.
    * **Example**: `dwh_load_date` $\rightarrow$ System-generated column used to store the date when the record was loaded.