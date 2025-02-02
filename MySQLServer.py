import mysql.connector

try:
    mydb = mysql.connector.connect(host="localhost", user="karim", passwd="root")
except Exception as err:
    raise err
else:
    print(f"Database 'alx_book_store' created successfully")

mycursor = mydb.cursor()

mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
mycursor.execute("USE alx_book_store")
mycursor.execute(
    """CREATE TABLE IF NOT EXISTS Books(
                        Book_id INT PRIMARY KEY,
                        title VARCHAR(130)                    
                    );"""
)
mycursor.execute("INSERT INTO Books(Book_id, title) VALUES (4, 'Othman'), (5, 'Ali');")


for i in mycursor:
    print(i)


mycursor.close()
mydb.close()
