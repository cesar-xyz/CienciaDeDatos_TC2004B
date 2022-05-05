import streamlit as st
import pandas as pd
from io import StringIO 
import matplotlib.pyplot as plt

st.subheader("Dataset")
data_file = st.file_uploader("Upload CSV",type=["csv"])
		
if data_file is not None:
    file_details = {"filename":data_file.name, "filetype":data_file.type,"filesize":data_file.size}
    #st.write(file_details)
    df = pd.read_csv(data_file)
    #st.dataframe(df)
    st.sidebar.header('Select what to display')
    pol_parties = df['Ingles'].unique().tolist()
    pol_party_selected = st.sidebar.multiselect('Nivel de ingles', pol_parties, pol_parties)
    nb_deputies = df['Ingles'].value_counts()
    nb_mbrs = st.sidebar.slider("Cuantos candidatos", int(nb_deputies.min()), int(nb_deputies.max()), (int(nb_deputies.min()), int(nb_deputies.max())), 1)

    #creates masks from the sidebar selection widgets
    mask_pol_par = df['Ingles'].isin(pol_party_selected)#get the parties with a number of members in the range of nb_mbrs
    mask_mbrs = df['Ingles'].value_counts().between(nb_mbrs[0], nb_mbrs[1]).to_frame()
    mask_mbrs= mask_mbrs[mask_mbrs['Ingles'] == 1].index.to_list()
    mask_mbrs= df['Ingles'].isin(mask_mbrs)
    df_filtered = df[mask_pol_par & mask_mbrs]
    st.write(df_filtered)
    fig1 = df_filtered.groupby('Ingles').size().plot(kind='pie', autopct='%.2f').figure
    st.pyplot(fig1)