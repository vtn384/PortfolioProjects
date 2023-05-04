import pandas as pd 
data = pd.read_excel("/Users/vidaanguyenn/Downloads/Food Mood/Food_Mood.xls")
df = pd.DataFrame(data, columns = ["Category", "Food_Types", "Restaurant"]) 

def res_choices():
    category = input(f"\n Here is the food catergory: {data.Category.unique()}; choose one: ")
    food_df = data[data["Category"] == category] 
    food_typ = input(f"\n What type of food do you want to eat? {food_df.Food_Types.unique()}: ")
    food_df2 = food_df[food_df["Food_Types"] == food_typ]
    res = input(f"\n Choose a restaurant: {food_df2.Restaurant.unique()}: ")
    return res

user1 = []
def user1_method():
    name1 = input("\n Enter your name: ")
    print(f"\n Hi {name1}!")
    for x in range(0,3):
        user1.append(res_choices())
    print(f"\n {name1}, here are your choices: {user1}")
user1_method()

print("__________________________________________________")

user2 = []
def user2_method():
    name2 = input("\n Enter your name: ")
    print(f"\n Hi {name2}!")
    for x in range(0,3):
        user2.append(res_choices())
    print(f"\n {name2}, here are your choices: {user2}")
user2_method()

results = [element for element in user1 if element in user2]
if len(results) > 0:
    print(f"\n It's a match! Matches: {results}")
else:
    print("\n No matches found! Try again.")
