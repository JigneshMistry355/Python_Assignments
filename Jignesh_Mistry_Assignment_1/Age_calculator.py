import datetime

try:
    try:
        user_input = input("Enter Birth Date (mm/dd/yyyy) : ").strip().split('-')
        user_input = (list(map( lambda x: int(x), user_input )))
        year, day, month = user_input[2], user_input[1], user_input[0]
        today = datetime.datetime.now()
        birth_date = datetime.datetime(year=year, month=month, day=day)
        age = today.date().year - birth_date.date().year
        
        if (today.date().month, today.date().day) < (birth_date.date().month, birth_date.date().day):
            age -= 1

        print("age", age)
        print(f"Today's date: {today.date()}")
        print("Birth date: ", birth_date.date())
        print("Bith date in IST format : ", birth_date.strftime("%d-%m-%Y"))

    except ValueError:
        raise Exception("Invalid input format")

except ValueError:
    print("Invalid Input value")



