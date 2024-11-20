USE db_tp;

CREATE TABLE hobbies (  
    id_hobbie INT NOT NULL UNIQUE,  
    hobbie VARCHAR(255) NOT NULL,  
    PRIMARY KEY (id_hobbie)  
);  

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/hobbies.csv'  
INTO TABLE db_tp.hobbies  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS;  

SELECT * FROM db_tp.hobbies;  

