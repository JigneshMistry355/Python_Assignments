from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd
import time

options = webdriver.ChromeOptions()
options.add_argument("--start-maximized")
options.add_argument("--disable-blink-features=AutomationControlled")

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)


url = "https://www.ebay.com/b/Christmas-Trees/117414/bn_1853732"
print("Opening Ebay...")
driver.get(url)

time.sleep(3)


print("Scrolling to load products...")

for i in range(7):  
    driver.execute_script("window.scrollBy(0, 800);")
    time.sleep(1.5)


try:
    product_cards = WebDriverWait(driver, 10).until(
        EC.presence_of_all_elements_located(
            (By.CSS_SELECTOR, "div.brwrvr__item-card__body")
        )
    )
except:
    print(" No products found")
    driver.quit()
    exit()

print(f"Found {len(product_cards)} products")

data = []


for card in product_cards:

    
    try:
        name = card.find_element(By.CSS_SELECTOR, "span.bsig__title").text
    except:
        name = "N/A"

    
    try:
        price = card.find_element(By.CSS_SELECTOR, ".bsig__price--displayprice").text
    except:
        price = "N/A"

    
    try:
        FreeShipping = card.find_element(By.CSS_SELECTOR, "span.bsig__logisticsCost").text
    except:
        FreeShipping = "N/A"


    data.append({
        "Name": name,
        "Price": price,
        "FreeShipping": FreeShipping,
    })

driver.quit()


df = pd.DataFrame(data)
print(df)

df.to_csv("Ebay_Christmas_Tree.csv", index=False)
print("Ebay_Christmas_Tree.csv")
