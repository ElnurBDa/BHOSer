# Import
```
import pandas as pd
```
# Pandas - Intro
## Pandas Series
it is like dictionary
```python
my_index = ['USA', 'Canada', 'Mexico']
my_data = [1776, 1867, 1821]
my_series = pd.Series(data=my_data, index=my_index)
'''
USA       1776
Canada    1867
Mexico    1821
dtype: int64
'''

ages = {"Sam": 5, 'Frank': 10, 'Spike': 7}
my_series = pd.Series(ages)
'''
Sam       5
Frank    10
Spike     7
dtype: int64
'''
ages.keys() # Index(['Sam', 'Frank', 'Spike'], dtype='object')
ages.values # array([ 5, 10, 7])
my_series**3 # do some math on them
'''
Sam       125
Frank    1000
Spike     343
dtype: int64
'''

sales_q1 = pd.Series({'Japan': 80, 'China': 450, 'India': 200, 'USA': 250})
sales_q2 = pd.Series({'Brazil': 100, 'China': 500, 'India': 210, 'USA': 260})
sales_q1 + sales_q2
'''
Brazil      NaN
China     950.0
India     410.0
Japan       NaN
USA       510.0
dtype: float64
'''

sales_q1.add(sales_q2, fill_value=0)
'''
Brazil    100.0
China     950.0
India     410.0
Japan      80.0
USA       510.0
dtype: float64
'''
```
### Merging Series
```python
inner_join_df = pd.merge(df1, df2, on="Customer_id", how="inner")
outer_join_df = pd.merge(df1, df2, on="Customer_id", how="outer")
left_join_df = pd.merge(df1, df2, on="Customer_id", how="left")
right_join_df = pd.merge(df1, df2, on="Customer_id", how="right")
```
## Pandas Dataframes
it is like tables
### From arrays to df
```python
np.random.seed(101)
mydata = np.random.randint(0,101,(4,3))
'''
array([[95, 11, 81],
       [70, 63, 87],
       [75,  9, 77],
       [40,  4, 63]])
'''
myindex = ['Baku', 'Ganja', 'Guba', 'Sumgayit']
mycolumns = ['Jan', 'Feb', 'Mar']
df = pd.DataFrame(data=mydata, index=myindex, columns=mycolumns)
'''
			Jan	Feb	Mar
Baku		95	11	81
Ganja		70	63	87
Guba		75	9	77
Sumgayit	40	4	63
'''
df.info() # gives information about the table
``` 
### Some operations on df
```python
df.columns # names of columns
df.index
df.head() # By default first 5 rows
df.tail() # By default last 5 rows
df.describe() # Provide some statistical information about numeric columns
df.transpose() # Changes the table by 90 degree
```
### Columns
```python
df["Column Name"] # returns only that column's values
df[["Column Name 1", "Column Name 2"]] # multiple columns
df["New Column Name"] = df["C1"]+df["C2"] # and maybe some other operations from existing columns
df = df.drop('Column Name',axis=1) # Delete a column, if axis=0 it will drop a row

df = df.set_index('Name') # if table has Name column, after this the index will be not 0 1 ... but some Names in the same column
df = df.reset_index() # makes index numbers from 0 1 ...

df.iloc[0] # Get first row with location
df.iloc[0:3] # Get certain rows
df.loc['Alex'] # Get first row with label
df.loc[["Alex", 'Bert', 'Carl']] # Get multiple rows with labels

df = df.drop('Alex', axis=0) # remove row when index is Name
df = df.drop(2, axis=0) # remove row when index is number
```
### Conditional Formatting
```python
df[<Condition>]
df[df["Some column"] > 123]
df[(df['Age'] > 40) & (df['Sex'] == 'M')]   # & meand and, | means or
df[df['Age'].between(20, 30)]

options = [42, 32, 29]
df[df['Age'].isin(options)] # one of those
```
### Other useful things
```python
df['Column Name'].apply(some_function) # run some function on values. 
# Example
def last_digit(num):
    return num % 10
df['Weight (lbs)'].apply(last_digit)
'''Name
Bert    6
Carl    5
Dave    7
Elly    4
Fran    5
Gwen    1
'''

df.sort_values('Column')
df["Column"].max()
df["Column"].idmax() # id of max
df["Column"].min()
df["Column"].idmin() # id of min

df['Column'].value_counts() # count of value that are in column. 
'''
Gender
M    10
F     7
''' 

df['Column'].unique() # Returns values without repeating
df.drop_duplicates() # removes the same rows
```
## Missing Data
Some cells maybe NaN (Not a number) or null, needs to be filled with smth
```python
df.isnull() # Returns boolean based on values being null or not
df.notnull() # Opposite of df.isnull()
df[df['pre_movie_score'].notnull()] # select rows where pre_movie_score is not null
df[(df['pre_movie_score'].isnull()) & (df['first_name'].notnull())]

df.dropna() # remove NaN
df.dropna(thresh=4) # if number of NaNs in row less than 4 then the row is not droped, but more then drop
df.dropna(subset=['last_name']) # only drops if NaN in the specified column(s)

df['pre_movie_score'].fillna(0) # Fill all NaN values in pre_movie_score column with 0
df['pre_movie_score'].fillna(df['pre_movie_score'].mean())

ser = pd.Series({'first':100, 'business':np.nan, 'economy-plus':50, 'economy':30})
ser.interpolate() # Replace NULL values with the number between the previous and next row
'''
first           100.0
business         75.0
economy-plus     50.0
economy          30.0
dtype: float64
'''
```
## GroupBy
```python
df.groupby('model_year') # grouping by one column, for example, some rows have year of 80, then these particular rows will be grouped
df.groupby('model_year').describe() # get statistics
df.groupby('model_year').mean()['mpg']
df.groupby(['model_year', 'cylinders']).mean()  # multiple column groupby

year_cyl = df.groupby(['model_year', 'cylinders']).mean()
year_cyl.index.names # FrozenList(['model_year', 'cylinders'])
year_cyl.index.levels # FrozenList([[70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82], [3, 4, 5, 6, 8]])
year_cyl.loc[70]
year_cyl.loc[[70, 82]] # model_year with 70 and 82 
year_cyl.loc[(70, 6)] # model_year 70 and cylinders 6
year_cyl.xs(key=70,level='model_year') # The xs() method returns a specified section of the DataFrame.
year_cyl.xs(key=4,level='cylinders')

df[df['cylinders'].isin([6,8])].groupby(['model_year', 'cylinders']).mean()

year_cyl.swaplevel() # Default is to swap the two innermost levels of the index.
year_cyl.sort_index(level='model_year', ascending=False)


df.agg(['std', 'mean'])['mpg']
df.agg({'mpg':['max','mean'], 'weight':['mean', 'std']})

```
## Concatenation
```python
one = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'], 'B': ['B0', 'B1', 'B2', 'B3']})
two = pd.DataFrame({'C': ['C0', 'C1', 'C2', 'C3'], 'D': ['D0', 'D1', 'D2', 'D3']})

pd.concat([one,two],axis=1) # added to right
pd.concat([one,two],axis=0) # added to down
```
# Reading table from
## HTML
```python
tables = pd.read_html('table_data.html') # get all tables from file
tables = pd.read_html('https://en.wikipedia.org/wiki/Python_(programming_language)') # get all tables from URL
df1 = tables[0] # Save first table
df2 = tables[1] # Save second table

# with requests
r = requests.get('https://en.wikipedia.org/wiki/Python_(programming_language)', auth=('john', 'johnspassword'))
tables = pd.read_html(r.text)

# write html
df = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
df.to_html('write_html.html')
```
## Mysql
```python
import mysql.connector as connection
import pandas as pd

try:
    mydb = connection.connect(host="localhost", database = 'azerbaijandb', user="root", passwd="root", use_pure=True)
    query = "Select * from administrative_divisions;"
    result_dataFrame = pd.read_sql(query, mydb) # print results as Pandas DataFrame
    result_dataFrame.to_csv('data_to_csv.csv')  # converting DataFrame to CSV format
    mydb.close()  # closing the database safely
except Exception as e:
    mydb.close()
    print(str(e))


# pip install pandas
# pip install sqlalchemy
# pip install mysql-python
# pip install mysqlclient


import pandas as pd 
my_conn = create_engine("mysql+mysqldb://root:root@localhost/azerbaijandb")
my_data = pd.read_sql("SELECT * FROM administrative_divisions", my_conn)
```
## JSON
```python
df = pd.read_json('students.json') # read from json file
print(df.to_string()) ## Use to_string() to print the entire DataFrame.

url = "https://jsonplaceholder.typicode.com/todos"
df = pd.read_json(url)
```
## CSV
```python
df = pd.read_csv('example.csv', header=None)
df.to_csv('new_file.csv', index=False)
```
## XLSX
```python
df = pd.read_excel('new_excel.xlsx', sheet_name='Sheet1')
pd.ExcelFile('new_excel.xlsx').sheet_names # get sheet names

excel_sheets = pd.read_excel('new_excel.xlsx',sheet_name=None)
excel_sheets.keys() # dict_keys(['Sheet1', 'Sheet2'])
excel_sheets['Sheet2']

df.to_excel('example.xlsx', sheet_name='First_Sheet', index=False)
```
# Formatting of imported data
```python
world_pop = world_pop['World population (millions, UN estimates)[15]'].drop('#', axis=1)

```