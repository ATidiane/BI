# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd

df_mig = pd.read_csv("../Initial Data/MIG.csv", encoding="utf-8")


def get_columns(listcolumns, dataframe, index=False):
    """ Returns a list of columns of the given dataframe

    :param listcolumns:
    :param dataframe:
    :returns:
    :rtype:

    """

    if index:
        return dataframe.iloc[:, listcolumns]
    else:
        return dataframe.loc[:, listcolumns]


def create_features(value, column, pos=True):
    """

    :param value:
    :param column:
    :param pos:
    :returns:
    :rtype:

    """

    if pos:
        def concat(x): return value + x
    else:
        def concat(x): return x + value

    return map(concat, column)


if __name__ == "__main__":
    code_pays = get_columns(['COU'], df_mig)
    all_countries = np.unique(code_pays.values.ravel())
    features_pays = create_features('immigres_', all_countries)
    features_pays = create_features(
        ' bigint NOT NULL,', features_pays, pos=False)
    print("\n".join(map(str, features_pays)))
