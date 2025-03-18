# Imports
import numpy as np
from typing import Any
# ============================================

# Functions
# With this function, the user can post-process the data from CACE, 
# plot it, save it and write it back to the CACE .yaml file.
# https://github.com/efabless/cace/blob/main/docs/source/tutorials/custom_scripts.md
def postprocess(results: dict[str, list], conditions: dict[str, Any]) -> dict[str, list]:
    # Print results and conditions for debugging
    # print(f'results: {results}')
    # print(f'conditions: {conditions}')
    
    # Iterate over gain MC results
    gain_mc_arr = []
    for gain_mc in results['gain_mc']:
        gain_mc_arr.append(gain_mc)
    print(f'gain_mc_arr = {gain_mc_arr}')
    
    # Delete statistical outliers in gain_mc_arr
    gain_mc_arr = [val for val in gain_mc_arr if 0.1 <= val <= 10]
    print(f'gain_mc_arr = {gain_mc_arr}')
    
    # Iterate over bw MC results
    bw_mc_arr = []
    for bw_mc in results['bw_mc']:
        bw_mc_arr.append(bw_mc)
    print(f'bw_mc_arr = {bw_mc_arr}')
    
    # Delete statistical outliers in bw_mc_arr
    bw_mc_arr = [val for val in bw_mc_arr if 10e3 <= val <= 10e9]
    print(f'bw_mc_arr = {bw_mc_arr}')
    
    # Save data as .csv for later use
    np.savetxt('cace/scripts/ota-5t-ac.csv', 
        np.column_stack((np.array(gain_mc_arr), np.array(bw_mc_arr))), comments = "", 
        header = "gain_mc_arr,bw_mc_arr", delimiter = ",")

    return {'gain_mc_arr': gain_mc_arr, 'bw_mc_arr': bw_mc_arr}
# ============================================