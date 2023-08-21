import requests
import time
from pymongo import MongoClient
import logging
import yaml
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
import threading
import csv
from more_itertools import divide


def get_data_and_insert(list_product_id, api, headers):
    """
    Get data for each product_id and insert into mongodb
    """
    client= MongoClient('localhost', 27017)
    db = client.Products

    session = requests.Session()
    retry = Retry(connect=3, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)
    
    for i,pid in enumerate(list_product_id):

        url_product = api + str(pid)

        try:    
            response = session.get(url_product, headers=headers)
            
            if response.status_code == 200:       
                product_data = response.json()
                
                logging.warning("Request success for product_id: " + str(pid))
                db.ProductsDataTiki.insert(product_data)

        except Exception as e:
            logging.warning(e)
            logging.warning("Request failed for product_id: " + str(pid))

        if i % 5 == 0:
            time.sleep(6.20)

if __name__ == "__main__":

    start = time.time()

    with open("config.yaml") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)

    # get product_id from files 
    list_product_id_m = []

    # change files
    file_crawl = "divide_products/divpro3.csv"

    logging.basicConfig(filename='log/getProductData.log', filemode= 'a')

    with open(file=file_crawl, mode='r') as f:
        reader = csv.reader(f)
        next(reader, None)
        for row in reader:
            list_product_id_m.append(row)

    list_product_id = [int(c[0]) for c in list_product_id_m]
    
    # Divide list into 3 threads
    child_ls = divide(3, list_product_id)
    res1, res2, res3 = [list(c) for c in child_ls]

    logging.warning("Starting crawl data from files {}".format(file_crawl))

    t1 = threading.Thread(target=get_data_and_insert, args=(res1,config['api_tiki'],config['headers']))
    t2 = threading.Thread(target=get_data_and_insert, args=(res2,config['api_tiki'],config['headers']))
    t3 = threading.Thread(target=get_data_and_insert, args=(res3,config['api_tiki'],config['headers']))

    t1.start()
    t2.start()
    t3.start()

    t1.join()
    t2.join()
    t3.join()

    logging.warning("Complete crawl data from files {}".format(file_crawl))

    
    end = time.time()

    print("The time of execution is :",
      (end-start), "s")
