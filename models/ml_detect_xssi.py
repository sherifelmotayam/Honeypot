# -*- coding: utf-8 -*-
"""ml_detect_xssi modeling ml algo.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1h2OcDhgHiLVx6_u5HlfTz9roYKkPH9-K

# Modeling and evaluation of machine learning model

Import all dependencies
"""
# Commented out IPython magic to ensure Python compatibility.
# %matplotlib inline
import pandas as pd
import numpy as np
import string
from IPython.display import display
"""# Modeling data with Xgboost Classifier"""
import xgboost as xgb

#evaluations
# from sklearn.metrics import confusion_matrix
# from sklearn.metrics import roc_curve

class CrosssiteScriptingInjectionDetector:
  __data = pd.read_csv("C:/xampp/htdocs/python-pusher-traffic-monitor/dataset/final-allpayload.csv",index_col="index")
  __independent_variables=['length', 'non-printable','punctuation', 'min-byte', 'max-byte', 'mean-byte', 'std-byte','distinct-byte', 'sql-keywords', 'js-keywords']
  __sql_keywords = pd.read_csv('C:/xampp/htdocs/python-pusher-traffic-monitor/dataset/SQLKeywords.txt', index_col=False)
  __js_keywords = pd.read_csv("C:/xampp/htdocs/python-pusher-traffic-monitor/dataset/JavascriptKeywords.txt",index_col=False)
  #data
  """Selecting dependent and independent variables"""
  __Y = __data['is_malicious']
  """independent_variables = data.columns
  independent_variables = independent_variables.delete(1)
  independent_variables"""
  __X = __data.iloc[:,3:]
  # __X
  def __init__(self):
    #?xgb.XGBClassifier()
    self.__xgb_classifer = xgb.XGBClassifier()
    self.__xgb_classifer.fit(self.__X, self.__Y)

    # Commented out IPython magic to ensure Python compatibility.
    # %time xgb_classifer.fit(X,Y)

    self.__data['predicted_is_malicious'] = self.__xgb_classifer.predict(self.__X)

    self.__data.head(30)

    self.__data[["is_malicious","predicted_is_malicious"]]

    #?plt.plot()

    #independent_variables
    self.__independent_variables = self.__data.columns
    # print("independent variables: ", self.__independent_variables)
  
  """# Integration with website"""
  def calculate_features_and_predict(self, payload):
    features = {} 
    payload = str(payload)
    features['length'] = len(payload)
    features['non-printable'] = len([1 for letter in payload if letter not in string.printable]) #! 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&'()*+, -./:;<=>?@[\]^_`{|}~ 
    features['punctuation'] = len([1 for letter in payload if letter in string.punctuation]) #! "#$%&'()*+, -./:;<=>?@[\]^_`{|}~
    features['min-byte'] = min(bytearray(payload,'utf-8'))
    features['max-byte'] = max(bytearray(payload,'utf-8'))
    features['mean-byte'] = np.mean(bytearray(payload,'utf-8'))
    features['std-byte'] = np.std(bytearray(payload,'utf-8')) #! standard deviation
    features['distinct-byte'] = len(set(bytearray(payload,'utf-8')))
    features['sql-keywords'] = len([1 for keyword in self.__sql_keywords['Keyword'] if str(keyword).lower() in payload.lower()])
    features['js-keywords'] = len([1 for keyword in self.__js_keywords['Keyword'] if str(keyword).lower() in payload.lower()])
    #payload_df = pd.DataFrame(data=features,index=[0],columns=independent_variables)
    payload_df = pd.DataFrame(features,index=[0])
    print("==============================")
    display(payload_df)
    print("==============================")
    result = self.__xgb_classifer.predict(payload_df)
    #display(result)
    return result[0]


if __name__ == "__main__":
  xssi = CrosssiteScriptingInjectionDetector()
  # xssi.calculate_features_and_predict("<>")
  # calculate_features_and_predict("<>")

  payload=''
  while (payload != 'exit' ):
    payload = input("Enter payload")
    result = xssi.calculate_features_and_predict(payload)
    if(result > 0):
      print(f"Your payload {payload} is malicious - 403 error\n")
    else:
      print(f"Your payload {payload} is safe 200 OK\n")
