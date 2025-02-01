CREATE TABLE Books(
    book_id INT NOT NULL,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE (10,2) NOT NULL,
    PRIMARY KEY(book_id),
    KEY FK_author_id (author_id),
    CONSTRAINT FK_author_id FOREIGN KEY (author_id) REFERENCES Authors (author_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Authors(
    author_id INT,
    author_name VARCHAR(215),
    PRIMARY KEY (author_id)
);

CREATE table Customers(
    customer_id INT,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address VARCHAR,
    PRIMARY KEY(customer_id)
);

CREATE TABLE Orders(
    order_id INT,
    customer_id INT,
    order_date DATE,
    PRIMARY KEY(order_id),
    KEY FK_customer_id(customer_id),
    CONSTRAINT FK_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Order_Details(
    order_detail_id INT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    PRIMARY KEY (order_detail_id),
    KEY FK_order_id(order_id),
    KEY FK_book_id(book_id),
    CONSTRAINT FK_order_id FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_book_id FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE RESTRICT ON UPDATE CASCADE
);