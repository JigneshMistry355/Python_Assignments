import math 

def primeNumber(n):
    if n ==2 or n == 3:
        return True
    elif n <= 1 or n % 2 == 0 or n % 3 == 0:
        return False
    x = int(math.sqrt(n)) + 1
    for i in range(5, x, 6):
        if n % i == 0 or n % (i+2) == 0:
            return False
    return True

user_input1 = int(input("Starting range: "))
user_input2 = int(input("End range: "))

primes = []
for i in range(user_input1, user_input2+1):
    if primeNumber(i):
        primes.append(i)

print(f"Prime Number from range {user_input1} to {user_input2} are : \n{primes}")

# Print 10 prime numbers per line
for i in range(len(primes)):
    if i % 10 == 0:
        print()
    print(primes[i], end=' ')
    
    