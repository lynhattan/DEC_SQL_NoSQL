import mysql.connector
import csv
from pymongo import MongoClient
import pandas as pd
import matplotlib.pyplot as plt

def num_products():
    mycursor.execute("SELECT category_id, count(*) FROM products_tiki GROUP BY category_id")
    with open("file_statistics/category_num_products.csv", "w", newline="") as f:
        headers = ["category_id", "num_products"]
        w = csv.writer(f)
        w.writerow(headers)
        for category_id, num_products in mycursor:
            data=[]
            data.append(category_id)
            data.append(num_products)
            w.writerow(data)

def top10_products():
    mycursor.execute("SELECT product_id,name FROM products_tiki ORDER BY quantity_sold DESC, rating_average DESC, price ASC LIMIT 10")
    with open("file_statistics/top10_products.csv", 'w', encoding='utf-8', newline="") as f:
        headers = ["product_id", "product_name"]
        w = csv.writer(f)
        w.writerow(headers)
        for product_id, name in mycursor:
            data=[]
            data.append(product_id)
            data.append(name)
            w.writerow(data)

def find_origin():
    ls_origin=[]
    for i in cursor:
        for j in i["specifications"]:
            for o in j["attributes"]:
                if o["code"] == "origin":
                    ls_origin.append(o["value"])

    print(ls_origin[0:10])

    for i in ls_origin: 
        if len(i.split(",")) >= 2:
            for a in i.split(","):
                ls_origin.append(a)
            ls_origin.remove(i)

    print(ls_origin[0:10])

    occurrence = {item: ls_origin.count(item) for item in ls_origin}
    return occurrence

if __name__ == "__main__":

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="17012021",
        database="products"
        )
    mycursor = mydb.cursor()

    client= MongoClient('localhost', 27017)
    db = client.products
    collection = db.productsTiki
    cursor= collection.find({},{"specifications.attributes.code": 1, "specifications.attributes.value": 1, "_id": 0})
    
    num_products()
    top10_products()

    occurrence = find_origin()
    df_occurrence = pd.DataFrame.from_dict(occurrence, orient="index", columns=["num_products"])
    plt.pie(df_occurrence["num_products"], labels= df_occurrence.index)
    plt.show()
