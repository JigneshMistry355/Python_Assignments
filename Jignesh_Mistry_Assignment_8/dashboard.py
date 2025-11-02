import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

df = pd.read_csv("heart.csv")

st.title("Heart Disease Dashboard")
plot = st.selectbox("Choose one", ['Patient count', 'Heart Disease Ratio', 'Cholestrol by sex'])
fig, ax = plt.subplots()

if plot == "Patient count":
    sns.histplot(data=df, x="age")
    plt.title("Count of petients by age")
    plt.show()
elif plot == "Heart Disease Ratio":
    sns.countplot(data=df, x=df['sex'].map({1:"Male", 0:"Female"}), hue='target')
    plt.xlabel("Gender")
    plt.ylabel("Count")
    plt.title("Male Vs Female count")
    plt.legend(title="Heart_Disease", labels=[ "No", "Yes"])
    plt.show()
else:
    sns.boxplot(x=df['sex'].map({1:"Male", 0:"Female"}), y='chol', data=df)
    plt.title(" Male Vs Female")
    plt.xlabel("Sex")
    plt.ylabel("Cholestrol")
    plt.show()

st.pyplot(fig)

plot1 = st.selectbox("Choose one", ['Scatter Plot', 'Cholestrol by Chest pain', 'Heatmap', 'pairplot'])
fig, ax = plt.subplots()
if plot1 == "Scatter Plot":
    sns.scatterplot(data=df, x="age", y="chol")
    plt.show()
elif plot1 == 'Cholestrol by Chest pain':
    sns.barplot(data=df, x="cp", y='chol', estimator='mean')
    plt.title("Average Cholestrol by Chest pain")
    plt.show()
elif plot1== 'Heatmap':
    corr=df.corr()
    sns.heatmap(corr, cmap="coolwarm")
    plt.show()
else:
    sns.pairplot(data=df, hue="thal", palette='coolwarm')
    plt.show()
st.pyplot(fig)