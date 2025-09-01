from flask import Flask, render_template, request, redirect, send_file, url_for, session
import mysql.connector
import pandas as pd
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
from reportlab.lib import colors
import csv
import io
from db_config import get_db_connection

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'  

allowed_reports = ['accounts', 'customers', 'reports', 'transactions', 'users']

@app.route('/')
def login_redirect():
    return redirect('/login')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT role FROM users WHERE username=%s AND password=%s", (username, password))
        result = cursor.fetchone()
        conn.close()

        if result:
            session['logged_in'] = True
            session['role'] = result[0]
            if result[0] == 'admin':
                return redirect(url_for('admin_reports'))  
            elif result[0] == 'viewer':
                return redirect(url_for('viewer_reports'))
            else:
                return "Unauthorized role", 403
        else:
            return render_template('login.html', error="Invalid username or password.")
        
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/login')

@app.route('/admin-reports')
def admin_reports():
    if not session.get('logged_in') or session.get('role') != 'admin':
        return redirect('/login')

    selected_report = request.args.get('report', 'reports')
    if selected_report not in allowed_reports:
        selected_report = 'reports'
 
    conn = get_db_connection()
    cursor = conn.cursor()

    if selected_report == 'reports':
        cursor.execute("SELECT id, name, description, created_by FROM reports")
    else:
        cursor.execute(f"SELECT * FROM {selected_report}")

    rows = cursor.fetchall()
    headers = [col[0] for col in cursor.description]
    cursor.close()
    conn.close()

    return render_template(
        'AdReportTable.html',
        report_names=allowed_reports,
        selected_report=selected_report,
        table_headers=headers,
        table_rows=rows
    )

@app.route('/insert', methods=['POST'])
def insert_user():
    username = request.form['username']
    password = request.form['password']
    role = request.form['role']
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, password, role) VALUES (%s, %s, %s)", (username, password, role))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=users')

@app.route('/update', methods=['POST'])
def update_user():
    user_id = request.form['id']
    username = request.form['username_up']
    password = request.form['password_up']
    role = request.form['role_up']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE users SET username=%s, password=%s, role=%s WHERE id=%s", (username, password, role, user_id))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=users')

@app.route('/delete', methods=['POST'])
def delete_user():
    user_id = request.form['id']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM users WHERE id=%s", (user_id,))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=users')


@app.route('/report-insert', methods=['POST'])
def insert_report():
    name = request.form['username']
    description = request.form['password']
    sql_query = request.form['role']  
    created_by = request.form['created_by']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO reports (name, description, sql_query, created_by) VALUES (%s, %s, %s, %s)",
        (name, description, sql_query, created_by)
    )
    conn.commit()
    conn.close()
    return redirect('/admin-reports')


@app.route('/report-update', methods=['POST'])
def update_report():
    report_id = request.form['id']
    name = request.form['username_up']
    description = request.form['password_up']
    sql_query = request.form['role_up']  
    created_by = request.form['created_by_up']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE reports SET name=%s, description=%s, sql_query=%s, created_by=%s WHERE id=%s",
        (name, description, sql_query, created_by, report_id)
    )
    conn.commit()
    conn.close()
    return redirect('/admin-reports')


@app.route('/report-delete', methods=['POST'])
def delete_report():
    report_id = request.form['id']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM reports WHERE id=%s", (report_id,))
    conn.commit()
    conn.close()
    return redirect('/admin-reports')

@app.route('/account-insert', methods=['POST'])
def insert_account():
    customer_id = request.form['customer_id']
    account_number = request.form['account_number']
    account_type = request.form['account_type']
    balance = request.form['balance']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO accounts (customer_id, account_number, account_type, balance) VALUES (%s, %s, %s, %s)",
                   (customer_id, account_number, account_type, balance))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=accounts')

@app.route('/account-update', methods=['POST'])
def update_account():
    account_id = request.form['account_id']
    customer_id = request.form['customer_id']
    account_number = request.form['account_number']
    account_type = request.form['account_type']
    balance = request.form['balance']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE accounts SET customer_id=%s, account_number=%s, account_type=%s, balance=%s WHERE account_id=%s",
                   (customer_id, account_number, account_type, balance, account_id))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=accounts')

@app.route('/account-delete', methods=['POST'])
def delete_account():
    account_id = request.form['account_id']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM accounts WHERE account_id=%s", (account_id,))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=accounts')


@app.route('/customer-insert', methods=['POST'])
def insert_customer():
    full_name = request.form['full_name']
    email = request.form['email']
    phone_number = request.form['phone_number']
    address = request.form['address']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO customers (full_name, email, phone_number, address) VALUES (%s, %s, %s, %s)",
                   (full_name, email, phone_number, address))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=customers')

@app.route('/customer-update', methods=['POST'])
def update_customer():
    customer_id = request.form['customer_id']
    full_name = request.form['full_name']
    email = request.form['email']
    phone_number = request.form['phone_number']
    address = request.form['address']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE customers SET full_name=%s, email=%s, phone_number=%s, address=%s WHERE customer_id=%s",
                   (full_name, email, phone_number, address, customer_id))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=customers')

@app.route('/customer-delete', methods=['POST'])
def delete_customer():
    customer_id = request.form['customer_id']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM customers WHERE customer_id=%s", (customer_id,))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=customers')


@app.route('/transaction-insert', methods=['POST'])
def insert_transaction():
    account_id = request.form['account_id']
    transaction_type = request.form['transaction_type']
    amount = request.form['amount']
    description = request.form['description']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO transactions (account_id, transaction_type, amount, description) VALUES (%s, %s, %s, %s)",
                   (account_id, transaction_type, amount, description))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=transactions')

@app.route('/transaction-update', methods=['POST'])
def update_transaction():
    transaction_id = request.form['transaction_id']
    account_id = request.form['account_id']
    transaction_type = request.form['transaction_type']
    amount = request.form['amount']
    description = request.form['description']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE transactions SET account_id=%s, transaction_type=%s, amount=%s, description=%s WHERE transaction_id=%s",
                   (account_id, transaction_type, amount, description, transaction_id))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=transactions')

@app.route('/transaction-delete', methods=['POST'])
def delete_transaction():
    transaction_id = request.form['transaction_id']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM transactions WHERE transaction_id=%s", (transaction_id,))
    conn.commit()
    conn.close()
    return redirect('/admin-reports?report=transactions')

@app.route('/viewer-reports')
def viewer_reports():
    selected_report = request.args.get('report', 'reports')

    if selected_report not in allowed_reports:
        selected_report = 'reports'
   
    query = (
        "SELECT id, name, description, created_by FROM reports"
        if selected_report == 'reports'
        else f"SELECT * FROM {selected_report}"
    )

    conn = get_db_connection()
    df = pd.read_sql(query, con=conn)
    conn.close()

    return render_template(
        'VwReportTable.html',
        report_names=allowed_reports,
        selected_report=selected_report,
        table_headers=list(df.columns),
        table_rows=df.values.tolist()
    )

@app.route('/download')
def download():
    report = request.args.get('report')
    file_format = request.args.get('format', 'csv')

    if not report or report not in allowed_reports:
        return "Invalid Report", 400

    query = (
        "SELECT id, name, description, created_by FROM reports"
        if report == 'reports'
        else f"SELECT * FROM {report}"
    )

    conn = get_db_connection()
    df = pd.read_sql(query, con=conn)
    conn.close()

    
    if file_format == 'csv':
        output = io.StringIO()
        df.to_csv(output, index=False)
        output.seek(0)
        return send_file(
            io.BytesIO(output.getvalue().encode()),
            mimetype='text/csv',
            as_attachment=True,
            download_name=f"{report}_report.csv"
        )
  
    elif file_format == 'txt':
        output = io.StringIO()
        df.to_string(buf=output, index=False)
        output.seek(0)
        return send_file(
            io.BytesIO(output.getvalue().encode()),
            mimetype='text/plain',
            as_attachment=True,
            download_name=f"{report}_report.txt"
        )

    elif file_format == 'pdf':
        pdf_output = io.BytesIO()
        doc = SimpleDocTemplate(pdf_output, pagesize=letter)
        elements = []

        data = [list(df.columns)] + df.values.tolist()

        t = Table(data)
        t.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.gray),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, -1), 8),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 10),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.black),
        ]))

        elements.append(t)
        doc.build(elements)
        pdf_output.seek(0)

        return send_file(
            pdf_output,
            mimetype='application/pdf',
            as_attachment=True,
            download_name=f"{report}_report.pdf"
        )

    else:
        return "Unsupported format", 400

if __name__ == '__main__':
    app.run(debug=True)