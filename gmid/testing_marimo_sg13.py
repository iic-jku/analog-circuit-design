import marimo

__generated_with = "0.10.15"
app = marimo.App(width="medium")


@app.cell(hide_code=True)
def _():
    import marimo as mo
    return (mo,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(
        r"""
        # Reactive Python notebook for IHP SG13G2 MOSFET charateristics

        **Copyright 2024 Simon Dorrer and Harald Pretl**

        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at
        http://www.apache.org/licenses/LICENSE-2.0
        """
    )
    return


@app.cell(hide_code=True)
def _():
    devices = ['sg13_lv_nmos', 'sg13_lv_pmos']
    choice = 0 # select which device to plot, start from 0
    return choice, devices


@app.cell(hide_code=True)
def _():
    import numpy as np
    import pandas as pd
    import matplotlib.pyplot as plt
    # widths used for characterization
    w = np.array([5, 5])
    return np, pd, plt, w


@app.cell(hide_code=True)
def _(choice, devices, pd):
    # read ngspice data
    df_raw = pd.read_csv('sizing/techsweep_'+devices[choice]+'.txt', sep=r'\s+')
    par_names = df_raw.columns.to_list()
    par_prefix = par_names[1].split('[')[0]

    # remove extra headers in file body and unwanted columns
    #df_raw = df_raw[~df_raw['v-sweep'].str.contains('v-sweep')]
    df = df_raw.drop(['frequency', 'frequency.1'], axis=1)
    df = df.apply(pd.to_numeric)

    # rename columns for readability
    df.columns = df.columns.str.removeprefix(par_prefix+'[')
    df.columns = df.columns.str.replace(par_prefix[1:], '')
    df.columns = df.columns.str.removesuffix(']')

    # round sweep vectors to easily addressable values
    df['l'] = df['l'].apply(lambda x: round(x/1e-6, 3))
    df['vgs'] = df['vgs'].apply(lambda x: round(x, 3))
    df['vds'] = df['vds'].apply(lambda x: round(x, 3))
    df['vsb'] = df['vsb'].apply(lambda x: round(x, 3))

    # print(df.columns)
    # Note on noise data: 
    # 1.: sid, sfl are thermal and flicker noise current densities at 1 Hz in A^2/Hz from operating point data
    return df, df_raw, par_names, par_prefix


@app.cell(hide_code=True)
def _(df, np):
    # sweep variable vectors
    l = np.unique(abs(df['l']))
    vgs = np.unique(abs(df['vgs']))
    vds = np.unique(abs(df['vds']))
    vsb = np.unique(abs(df['vsb']))
    return l, vds, vgs, vsb


@app.cell(hide_code=True)
def _():
    # Import techsweep data
    from pygmid import Lookup as lk
    lv_nmos = lk('sizing/sg13_lv_nmos.mat')
    lv_pmos = lk('sizing/sg13_lv_pmos.mat')
    return lk, lv_nmos, lv_pmos


@app.cell(hide_code=True)
def _(mo):
    mo.md("""Set Gate-Source Voltage:""")
    return


@app.cell(hide_code=True)
def _(mo, np, vgs):
    # Set up slider for Vgs, default is 0.9V
    vgs_slider = mo.ui.slider(steps=np.array(vgs), value=0.9)
    vgs_slider
    return (vgs_slider,)


@app.cell(hide_code=True)
def _(mo):
    mo.md("""Set Length:""")
    return


@app.cell(hide_code=True)
def _(l, mo, np):
    # Set up slider for L, default is minimum
    L_slider = mo.ui.slider(steps=np.array(l), value=l[0])
    L_slider
    return (L_slider,)


@app.cell(hide_code=True)
def _(L_slider, lv_nmos, mo, vgs_slider):
    # lookup a gm
    # list of parameters: VGS, VDS, VSB, L, W, NFING, ID, VT, GM, GMB, GDS, CGG, CGB, CGD, CGS, CDD, CSS
    gm = lv_nmos.lookup('GM', L=L_slider.value, VGS=vgs_slider.value, VDS=0.75, VSB=0)
    mo.md(f"gm = {round(float(gm/1e-3),3)} mS")
    return (gm,)


@app.cell(hide_code=True)
def _(L_slider, lv_nmos, mo, vgs_slider):
    # lookup a gds
    gds = lv_nmos.lookup('GDS', L=L_slider.value, VGS=vgs_slider.value, VDS=0.75, VSB=0)
    mo.md(f"gds = {round(float(gds/1e-3),3)} mS")
    return (gds,)


@app.cell(hide_code=True)
def _(L_slider, choice, devices, df, np, plt, vgs):
    # Plot gm/ID and fT versus gate bias for different L
    L1 = L_slider.value; VDS1=0.75; VSB1=0
    df1 = df.loc[(df['l'] == L1) & (abs(df['vds']) == VDS1) & (abs(df['vsb']) == VSB1)]
    gm_id1 = df1['gm'].values/df1['ids'].values
    cgg1 = df1['cgg'].values + df1['cgdol'].values+df1['cgsol'].values 
    ft1 = df1['gm'].values/cgg1/2/np.pi
    ft2 = df1['fug'].values

    fig, ax1 = plt.subplots()
    ax1.grid(axis='x')
    ax1.set_xlabel(r'$V_\mathrm{GS}$ (V)')
    color = 'tab:blue'
    ax1.set_ylabel(r'$g_\mathrm{m}/I_\mathrm{D}$ (S/A)', color=color)
    ax1.plot(vgs, gm_id1, color=color)
    ax1.tick_params(axis='y', labelcolor=color)
    ax2 = ax1.twinx()
    color = 'tab:red'
    ax2.set_ylabel(r'$f_\mathrm{T}$ (GHz)', color=color)
    ax2.plot(vgs, ft1/1e9, color=color)
    ax2.plot(vgs, ft2/1e9, color=color)
    ax2.tick_params(axis='y', labelcolor=color)
    fig.tight_layout()
    plt.title(devices[choice]+', $L$='+str(L1)+r'µm, $V_\mathrm{DS}$='+str(VDS1)+r'V, $V_\mathrm{SB}$='+str(VSB1)+'V')
    plt.xlim(0, 1.5)
    plt.axvline(x = df1['vth'].values[0], color='k', linestyle='--')
    plt.show()
    return L1, VDS1, VSB1, ax1, ax2, cgg1, color, df1, plt, ft1, ft2, gm_id1


@app.cell
def _(mo, plt):
    mo.mpl.interactive(plt.gcf())
    return


if __name__ == "__main__":
    app.run()
