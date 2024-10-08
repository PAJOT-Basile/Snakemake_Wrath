# Libraries
import os
import numpy as np

########################  Functions   ###############################
######################## Input_functions  ###############################


def flatten(list_to_flatten):
    """
    This function is done to unlist nested lists

    Parameters:
    ------------------------------------
    list_to_flatten: list
        This is a list that contains lists (nested list)

    Returns:
    ------------------------------------
    : list
        List that contains all that was contained in the nested lists, but in an un-nested list
    """
    return [item for sublist in list_to_flatten for item in sublist]
