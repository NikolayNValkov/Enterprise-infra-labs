#Ask the user for their birth year.
#Calculate their age in years and store it in a variable "age" (age = current_year - birth_year)
#Print: "You are [age] years old!"


birth_year = int(input('What is your birth year?'))
current_year = 2026

age=current_year - birth_year

print('You are', age , ' years old')


#Ask the user for their first and last name.
#Print a greeting: "Hello, [first name] [last name]! Welcome to Python programming."

firstname = input('What is your firstname?')
lastname = input('What is your lastname?')

print('Hello',(firstname + lastname) , '! Welcome to Python programming.')

#Accept a distance in kilometers as float using type conversion with float()
#Convert it to miles and store it in a new variable. (Miles=Kilometers×0.621371)
#Print the distance in miles

kilometers  = float(input('Enter a distance in kilometers'))
Miles=kilometers*0.621371
print (Miles)
