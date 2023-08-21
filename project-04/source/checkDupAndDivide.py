from pymongo import MongoClient
from more_itertools import divide
import csv

def remove_duplicate_product_id():
    """
    Remove duplicate of product_id to calculate number of products
    """

    client= MongoClient('localhost', 27017)
    db = client.Products

    group_productId = {
        "$group": {
            "_id": "$product_id"
        }
    }
    pipeline = [group_productId,]
    results = db.ProductsID_1Thread.aggregate(pipeline)

    list_product_id = []

    for pid in results:
        list_product_id.append(pid)

    print("Number of products: " + str(len(list_product_id)))
    return list_product_id

def divide_products(list_product_id):
    """
    Divide products into file smaller
    """
    child_ls = divide(25, list_product_id)
    
    count = 0
    for c in child_ls:
        count +=1
        with open("divide_products/divpro{}.csv".format(str(count)), mode='w') as f:
            writer = csv.DictWriter(f, fieldnames=['_id'])
            writer.writeheader()
            writer.writerows(list(c))

if __name__ == "__main__":

    list_product_id = remove_duplicate_product_id()
    divide_products(list_product_id)
