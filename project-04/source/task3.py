import json
from bs4 import BeautifulSoup
import mysql.connector
from lxml.html.clean import Cleaner
import logging

def handle_data(data, field):
    ls = []
    for i in range (0,len(data)): 
        try: 
            col = data[i][field]
            ls.append(col)            
        except Exception as e:
            col = None
            ls.append(col)
    return ls

def handle_data_html(data, field):
    ls = []
    for i in range (0, len(data)):
        try:
            col_html = data[i][field]
            soup = BeautifulSoup(col_html, "html.parser")
            cleaner = Cleaner(page_structure=False)

            ls_tags = [tag.name for tag in soup.find_all()]   
            cleaner.remove_tags=ls_tags   

            cleaned_html= cleaner.clean_html(col_html)
            cleaned_html= cleaned_html.replace("<div>","").replace("</div>","").replace("\n"," ")

            ls.append(cleaned_html)

        except Exception as e:
            col = None
            ls.append(col)
    return ls

def handle_data_nested(data, field, next):
    ls = []
    for i in range (0,len(data)): 
        try: 
            col = data[i][field][next]
            ls.append(col)            
        except Exception as e:
            col = None
            ls.append(col)
    return ls

def create_table():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="17012021",
        database="products"
        )
    mycursor = mydb.cursor()
    sql_create = "CREATE TABLE products_tiki (product_id VARCHAR(255) PRIMARY KEY, name MEDIUMTEXT, short_description MEDIUMTEXT, \
                                            description LONGTEXT, url VARCHAR(255), rating_average VARCHAR(5), \
                quantity_sold VARCHAR(10), price VARCHAR (20), category_id VARCHAR(20), day_ago_created VARCHAR(10))"
    
    mycursor.execute(sql_create)     
    mydb.commit()   
    mydb.close()

def insert_data_toMySQL(ls_all):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="17012021",
        database="products"
        )
    mycursor = mydb.cursor()
    sql_statements = "INSERT INTO products_tiki (product_id, name, short_description, description, url, rating_average, quantity_sold, price, \
                                category_id, day_ago_created) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    mycursor.executemany(sql_statements, ls_all)

    mydb.commit()
    
    mydb.close()

if __name__ == "__main__":

    logging.basicConfig(filename='InsertProductDataMYSQL.log', filemode= 'a')

    # create_table()

    for i in range(1,12):
        data = []
        with open('data/splitFile-{}'.format(i), 'r', encoding='utf-8-sig') as json_file:
            for line in json_file:
                data.append(json.loads(line))

        logging.warning("Complete load data file: {}".format(i))

        ls_product_id = handle_data(data, field="id")
        ls_name = handle_data(data, field="name")
        ls_short_desc = handle_data(data, field="short_description")
        ls_desc = handle_data_html(data, field="description")
        ls_url = handle_data(data, field="short_url")
        ls_rating_avg = handle_data(data, field="rating_average")
        ls_quantity_sold = handle_data_nested(data, field="quantity_sold",next="value")
        ls_price = handle_data(data, field="price")
        ls_category_id = handle_data_nested(data, field="categories", next="id")
        ls_day_ago_created = handle_data(data, field="day_ago_created")

        ls_all= list(zip(ls_product_id,ls_name,ls_short_desc,ls_desc,ls_url,ls_rating_avg,ls_quantity_sold,
                            ls_price,ls_category_id,ls_day_ago_created))
            
        logging.warning("Complete process data file: {}".format(i))

        logging.warning("Starting insert file: {}".format(i))
        
        insert_data_toMySQL(ls_all)

        logging.warning("Complete insert file: {}".format(i))
        
    logging.warning("Complete insert into MYSQL")