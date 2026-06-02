import pandas as pd

import matplotlib.pyplot as plt

print("matplot imported")
print("pandas imported")


df=pd.read_csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")
print(df.head())


print(df.isnull().sum())

print(df.duplicated().sum())
df.duplicated().sum()

print(df.shape)

print(df['Attrition'].value_counts())

print(df['Attrition'].value_counts(normalize=True)*100)


print(pd.crosstab(df['Department'], df['Attrition']))


dept_attrition=pd.crosstab(df['Department'],df['Attrition'],normalize="index")*100
print(dept_attrition)

print(pd.crosstab(df['OverTime'],df['Attrition']))
over_attritiom=pd.crosstab(df['OverTime'],df['Attrition'],normalize="index")*100
print(over_attritiom)

print(pd.crosstab(df['JobSatisfaction'],df['Attrition']))
print(df.groupby('Attrition')['MonthlyIncome'].mean())


print(pd.crosstab(df['WorkLifeBalance'],df['Attrition']))

print(df.groupby('Attrition')['YearsSinceLastPromotion'].mean())

print(df.groupby('Attrition')['DistanceFromHome'].mean())

print(df.groupby('JobRole')['MonthlyIncome'].mean().sort_values(ascending=False).head())


df['Attrition'].value_counts().plot(kind="bar")
plt.title('Employee Attrition Count')
plt.xlabel('Attrition')
plt.ylabel('Number of Employees')
plt.show()


pd.crosstab(
    df['Department'],
    df['Attrition']
).plot(kind='bar')

plt.title('Department vs Attrition')
plt.xlabel('Department')
plt.ylabel('Employee Count')

plt.show()

df['MonthlyIncome'].plot(kind='hist', bins=20)

plt.title('Monthly Income Distribution')
plt.xlabel('Monthly Income')
plt.ylabel('Number of employees')

plt.show()



df['Gender'].value_counts().plot(
    kind='pie',
    autopct='%1.1f%%'
)

plt.title('Gender Distribution')
plt.ylabel('')

plt.show()

df.to_csv("clean_hr_data.csv", index=False)