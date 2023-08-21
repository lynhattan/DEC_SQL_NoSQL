import requests
import time
import random
import logging
import yaml
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
import pandas as pd
import threading
from pymongo import MongoClient

def get_categories_urlkey():
    """
    Get list categories and urk key of tiki from file csv
    """

    df = pd.read_csv("data/categories_with_relationship.csv", sep=",")

    list_categories = [int(c[1:]) for c in df['LEAF_CAT_ID']]
    list_url_key =  [uk.split('/')[-2] for uk in df['LEAF_CAT_URL']]

    dict_categories_urlkey = dict(zip(list_categories, list_url_key))
    
    return dict_categories_urlkey

def get_product_id(dict_categories_urlkey, api, headers, params):
    """
    Get product_id of each product of each page for each categories and insert into MongoDB
    """
    session = requests.Session()
    retry = Retry(connect=3, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)
 
    client= MongoClient('localhost', 27017)
    db = client.Products
    list_product_id = []
    count=0

    for c, u in dict_categories_urlkey.items():
        params['category'] = c
        params['urkKey'] = u
        headers['Referer'] = "https://tiki.vn/" + u + "/" + "c" + str(c)

        i = 1
        while i <= 200:
            params['page'] = i
            try:    
                response = session.get(api, headers=headers, params=params)

                if response.status_code == 200 and response.json().get('data') != []:
                    logging.warning("Request success for category_id: " + str(c) + " at page: " + str(i))
                    for record in response.json().get('data'):
                        list_product_id.append({"product_id": record.get('id')})
                else:
                    break
            
            except Exception as e:
                logging.warning(e)

            if i % 5 == 0:
                time.sleep(random.randrange(3,5))

            i+=1

        time.sleep(3.5)

        count += 1
        logging.warning("Complete get productId for category: " + str(count))
   
    db.ProductsID_1Thread.insert_many(list_product_id)
    
if __name__ == "__main__":

    start = time.time()

    logging.basicConfig(filename='log/getProductId.log', filemode= 'w')

    with open("config/config.yaml") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)

    dict_categories_urlkey = get_categories_urlkey()


    t1 = threading.Thread(target=get_product_id, 
                          args=(dict_categories_urlkey,config['api_tiki'],config['headers'], config['params']))

    t1.start()
    t1.join()

    end = time.time()
    
    logging.warning("Success get full product_id!!!")

    logging.warning("The time of execution is :",
      (end-start), "s")
    