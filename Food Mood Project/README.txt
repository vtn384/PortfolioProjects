Food Mood Matching Program
This Python program is designed to match food preferences between two people. It utilizes an Excel file containing information about food categories, food types, and restaurants, and prompts the users to select their preferred options.

Dependencies:
The program requires the Pandas library to read and manipulate data from the Excel file. If you do not have the Pandas library installed, you can install it using the following command in your terminal:
pip install pandas

Usage:

To use the program, follow these steps:

Download the "Food_Mood.xls" file and save it to your computer.
Open the "Food Mood Matching Program" Python script in your preferred IDE or text editor.
Modify the file path in the line data = pd.read_excel("/Users/vidaanguyenn/Downloads/Food Mood/Food_Mood.xls") to the location where you saved the Excel file.
Run the program.
When prompted, enter your name and select your preferred food category, type of food, and restaurant. Repeat this step until you have selected 3 restaurants.
After both users have entered their choices, the program will print any matches found.

Improvements:
The program currently lacks input validation and error handling. It is possible to enter invalid food categories, types of food, or restaurant names, which may cause the program to crash. Additionally, the program does not handle cases where one user enters fewer than 3 choices. To improve the program, consider adding validation and error handling to ensure that only valid options are entered, and to handle cases where the users enter different numbers of choices.
