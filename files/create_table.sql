CREATE TABLE IF NOT EXISTS stocks (
    stock_id int(5) NOT NULL AUTO_INCREMENT,
    sym varchar(4) DEFAULT NULL,
    name varchar(50) DEFAULT NULL,
    price decimal(10,2) DEFAULT NULL,
    html varchar(1000) DEFAULT NULL,
    PRIMARY KEY(stock_id)
    );
