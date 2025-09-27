import streamlit as st
import json, requests

###########################################################################################
# 1. Create a python dictionary and convert it into json file
###########################################################################################

st.markdown(f'''1. Convert ***:red[dictionary]*** to ***:orange[json]***''')
my_details = st.text_area('Create a dictionary here:  (Press Ctrl + Enter to see the dictionary)')

def isValidJSON(json_string):
    try:
        json.loads(json_string)
        return True
    except ValueError:
        return False

if my_details:
    result = my_details
    if isValidJSON(result):
        st.write(result)
        json.dumps(result)
        with open("my_details.json", 'w') as f:
            f.writelines(result)
    else:
        st.markdown(f"Invalid ***:orange[JSON]*** format")


###########################################################################################
# 2. load a json file and print specific key
###########################################################################################

st.markdown(f"---")
st.markdown("2. load a ***:orange[json]*** file and print specific key")

with open("user.json", "r") as f:
    users = json.load(f)
    st.markdown(f"**Names** of all users : ")
    i = 1
    for user in users:
        st.write(i, user["name"])
        i += 1


###########################################################################################
# 3. load a json file and print users older than 25 years of age
###########################################################################################

st.markdown(f"---")
st.markdown("2. load a ***:orange[json]*** file and print users older than 25 years of age")

with open("user.json", "r") as f:
    users = json.load(f)
    st.markdown(f"**Names** of all users with age greater than 25 ")
    i = 1
    for user in users:
        if user["age"] > 25:
            st.write(i, user["name"])
            i += 1


###########################################################################################
# 4. Fetch 10 titles from the following url
###########################################################################################

st.markdown(f"---")
st.markdown("Fetch 10 titles ..")

url = 'https://jsonplaceholder.typicode.com/posts'
fetched_data = requests.get(url)
titles = fetched_data.text
result = json.loads(titles)
for i in range(len(result)):
    st.write(i+1, result[i]["title"])
    if i == 9:
        break


###########################################################################################
# 5. Capture response of the post request to following website
###########################################################################################

url = 'https://jsonplaceholder.typicode.com/posts'
st.markdown(f"---")
st.markdown("Post request ..")
data =  {
    "userId": 100,
    "id": 11,
    "title": "Something from Jignesh Mistry",
    "body": "Hello json placeholder"
  }
response = requests.post(url, data=data)
st.write(response.content)


###########################################################################################
# 6. Status code of response
###########################################################################################

st.markdown(f"---")
st.markdown("Get status 200 ..")
url = 'https://jsonplaceholder.typicode.com/posts'
response = requests.get(url)
st.markdown(
    f"The website resturned with status code : {response.status_code}"
)