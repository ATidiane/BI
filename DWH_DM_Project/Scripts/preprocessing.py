# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np

df_mig = pd.read_csv("../Initial Data/MIG.csv", encoding="utf-8")

def get_columns(listcolumns, dataframe, index=False):
    """ Returns a list of columns of the given dataframe

    :param listcolumns: 
    :param dataframe: 
    :returns: 
    :rtype: 

    """

    if index:
        return dataframe.loc[:, listcolumns]
    else:
        return dataframe.iloc[:, listcolumns]

def create_features(value, column, pos=True):
    """

    :param value: 
    :param column: 
    :param pos: 
    :returns: 
    :rtype: 

    """
    
    if pos:
        concat = lambda x: value + x
    else:
        concat = lambda x: x + value
        
    return map(concat, column)


if __name__=="__main__":
    code_pays = get_columns([0], df_mig)
    all_countries = np.unique(code_pays.values.ravel())
    features_pays = create_features('immigres_', all_countries)
    features_pays = create_features(' bigint NOT NULL,', features_pays, pos=False)
    print("\n".join(map(str, features_pays)))
