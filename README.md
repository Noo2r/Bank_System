# Banking System (Flask + MySQL)

## 📌 Project Objective
A simple web app to manage and view banking-related data using **Flask** and **MySQL**.  
It supports two roles:
- **Admin**: create, read, update, delete (CRUD) on 5 tables.
- **Viewer**: read-only access with the ability to download data.

> Tables: `users`, `reports`, `accounts`, `customers`, `transactions`

---

## 🧠 Project Features
- Login page with session-based access.
- **Admin** panel for CRUD across the 5 tables.
- **Viewer** page to view the same tables.
- Export data to **CSV**, **TXT**, or **PDF**.
- Whitelisted tables to avoid exposing other DB objects.

---

## 🧹 Project Structure
```
├─ .venv/ # local virtual environment
├─ pycache/
├─ localhost _ 127.0.0.1 _ aib _ reports _ php.../ # saved HTML assets (optional)
├─ static/ # static files (css/images)
| ├─ login.css
│ ├─ style.css
│ └─ image/ # logo and icon image 
├─ templates/ # Jinja2 templates: login, admin, viewer
│ ├─ login.html
│ ├─ AdReportTable.html
│ └─ VwReportTable.html
├─ app.py # Flask routes & logic
├─ bankdata (3).sql # sample schema/data
├─ db_config.py # MySQL connection helper
├─ localhost _ 127.0.0.1 _ aib _ reports _ php... .html # saved HTML page (optional)
└─ requirements.txt
```

---

## ⚙️ How to Run
1) **Install dependencies**
```bash
pip install -r requirements.txt
```

2) Configure database
Update db_config.py with your MySQL host, user, password, and database.

3)Start the app
```bash
python app.py
```
Open: http://127.0.0.1:5000/login

---
