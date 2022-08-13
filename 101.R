# Class 2
# author: "Taguhi Hakobyan"
# date: Nov 2, 2021

#R beginning course

##0: **Getting started**###########


##1. **Loading packages**###########

# Version 1: will ask for a lot of package dependancies
#  install.packages("dplyr")
library(dplyr) # importing the package
library(rstudioapi) # importing the package

## **Vectors**############
### **a. Creating Vectors**############
vector1 <- c(1,2,3,4,5,6)          # manually defining each element of the vector
vector2 <- rep(c(1,4), times=6)    # replicate given element(s) 6 times
vector3 <- 2:6                            
vector4 <- rep(1:2, times=3)
vector5 <- rep(1:2, each=3)
vector6 <- seq(2,3, by=0.5) 
str_vector1 <- c("a","b","c")
str_vector2 <- c("a",1,"c")

# In previous classes we learned about types of objects, like character, integer, logicals etc. Recall how to check the type of the object we use.
# version 1
class("a")
class(4)

# More explicit version
typeof("a")
typeof(4.5)
# What about the vectors? What about vectors that has mixed types of elements?

class(vector1)
class(str_vector2)

typeof(vector1)
typeof(str_vector2)
as.character(str_vector2)
as.numeric(str_vector2)

# Notice that you'll get a warning `"Warning message: NAs introduced by coercion"` meaning that R doesn't know how to convert character type into numeric so it replaces them with `NA`


### **b. Naming Elements** ############

# We can also name the elements of the vector: Below you will find 2 ways of doing it:

# **Version 1**
codes <- c(Italy=380, Canada=124, Egypt=818)
codes <- c("Italy"=380, "Canada"=124, "Egypt"=818)
codes

#**Version 2**

codes <- c(380, 124, 818)
country <- c("Italy", "Canada", "Egypt")
names(codes) <- country
codes

# **Why this is important?**
# If you name the elements, you can call them directly.

codes["Italy"]
codes[c("Egypt","Italy")]
names(codes)

# **Exercise:** Look at your calendar and record the number of meetings you have for this week. Then write them in the vector (it must have 5 elements, for each working day). Name the elements with the names of the week. Name your vector `weekly_meetings` . Write your answer in the box below
# Your code here:


# **Solution:**
weekly_meetings <- c(3,5,6,7,8)
names(weekly_meetings) <- c("Mon", "Tue", "Wed", "Thu", "Fri")

### **c. Vector Functions**############
#There are too many functions that can be applied to vectors. Let's take a look on some of them. Use `help()` to gain more understanding how to use these functions.

x <- c(4,9,2,7,5,7,8,4,6,8)

length(x)
sort(x, decreasing = FALSE)  # reorders vector elements into ascending or descending order
order(x)                     # returns the permutation which corresponds to sort() 
rank(x)
rev(x)                       # x in reverse order
table(x)
unique(x)                    # Unique values in the vector

max(x) 
which.max(x)                 #position of the max value
vector7 <- vector1-vector2   #elementwise sum and difference
vector8 <- vector1*vector4   #elementwise prod and div

# **Exercise:** Take a look at the `weekly_meetings` that you created. Find the average number of the meetings per day, the day of the week with the max and min number of meetings. Write your answer in the box below

# Your code here:

# **Solution:**
weekly_meetings <- c(3,5,6,7,8)
names(weekly_meetings) <- c("Mon", "Tue", "Wed", "Thu", "Fri")

names(weekly_meetings)[which.max(weekly_meetings)]
which.max(weekly_meetings)
mean(weekly_meetings)

### **d. Vector Slicing** ############

x[4]            # select 4th element
x[-4]           # select all but 4th element
x[2:4]          # Elements two to four.
x[-(2:4)]       # All elements except two to four.
x[c(1, 5)]      # Elements one and five.


x[x == 8]       # Elements which are equal to 8
x[x < 5]        # All elements less than zero.

## **Data.Frames**############

### **a. Creating DataFrames**############

# Let's utilize our knowledge of about vectors in creating dataframes. Basic ways of creating `data.frames` are:

emp_id <- c (1:5)
emp_name <- c("Rick","Dan","Michelle","Ryan","Gary")
salary  <- c(623.3,515.2,611.0,729.0,843.25)
emp.data1 <- data.frame(emp_id , emp_name , salary)

# Print the data frame.			
emp.data1

# You can get the same results if you directly put your vectors in the `data.frame`. Let's take a look on another example.

emp.data2 <- data.frame(
  emp_id = c (1:5), 
  emp_LastName = c("Thomson","Lopes","Martin","Gosling","Grande"),
  gender = c("Male","Male","Female","Male","Male")
)

emp.data2


# **Exercise:** Create 2 dataframes: df_1 and df_2. Both should contain only 2 columns and have only numerical values.
# Write your code here: 
# **Solution:**
df <- data.frame(x = 1:3, y = c('a', 'b', 'c'))
df
df_1 <- data.frame(col1=3:5, col2=4:6)
df_2 <- data.frame(col1=6:8, col2=7:9)
df_1
df_2

### **b. DataFrames Functions**############
# Some basic functions that can be used with `data.frames` are given below.

head(emp.data1,n=3)
nrow(emp.data1) # Number of rows.
ncol(emp.data1) # Number of columns. 
dim(emp.data1) # Number of columns and rows.
colnames(emp.data1)

# Look at the `data.frames` we created. If it makes sense, you can sum them up or take the product.

sum_dfs <- df_1+df_2
product_dfs <- df_1*df_2
colnames(sum_dfs) <- c("sum1", "sum2")
colnames(product_dfs) <- c("product1", "product2")
sum_dfs
product_dfs

# You can merge two datasets by columns.

emp.row_merg <- cbind(emp.data1,emp.data2)
emp.row_merg

# If you want to merge data.frame rows, you have to make sure they have the same column names.

# **Exercise:** Make the column names of emp.data2 identical to emp.data1.
# write your code here:

# **Solution:**
colnames(emp.data2) <- colnames(emp.data1)

emp.column_merg <- rbind(emp.data1,emp.data2)
emp.column_merg


### **c. Slicing DataFrames**############
emp.data1$salary
emp.data1[[2]] # call the second column
emp.data1[1,2] # first row, second column
emp.data1[,2]  # All rows, second columns
emp.data1[3,1] # 3rd row, first column 
# View(emp.data1) # See the full data frame

emp.data1[,"salary"]
emp.data1[2,"salary"]

head(emp.data1,n=2) # See the first 6 rows.
emp.row_merg[emp.row_merg[,"gender"]=="Male",]
# **Exercise:** Take a look at the emp.row_merg. Please filter below the dataframe for males who get higher than 600 salary.
# write your code here:
emp.row_merg[(emp.row_merg[,"salary"]>600)&(emp.row_merg[,"gender"]=="Male"),]


## **Lists**############

# Another important objects in R are `lists`. `Lists` can contain elements of different types like numbers, strings, vectors and another lists inside them. It also can contain a matrix or a function as its elements. There are key differences between `vectors` and lists, mainly:
#   
# 1.  A list holds different data such as `numeric`, `character`, `logical`, etc.
# 2.  `Vector` stores elements of the same type or converts implicitly.
# 3.  `Lists` are recursive, whereas `vector` is not (recursive function calls itself, i.e factorials).
# 4.  `vectors` are one-dimensional, whereas `lists` are a multidimensional objects.
# 
# You can create a `list` using `list()` function.

list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)
# As in case of `vectors`, you can name the elements of the `list`
list_data <- list(c("Jan","Feb","Mar"), data.frame(x = 1:3, y = c('a', 'b', 'c')),
                  list("green",12.3))
print(list_data)
# Give names to the elements in the list.
names(list_data) <- c("1st Quarter", "Data.Frame", "A Inner list")
# Show the list.
print(list_data)
# Just like in the case of `vectors` and `data.frames`, you can access to the `list` elements using square brackets, the element order or the name of the element.

#list_data[1]
#list_data$`1st Quarter`

# To add new, update or delete an elements of the `list`, use the following code. Please note, you can only add an element at the end of a `list.` You can delete any element of the `list`, but be careful, as the indexing of the `list` will change. You can update any element of the `list`.

# add new element
list_data[4] <- "New Element"
list_data[4]
# Remove the last element
list_data[3] <- NULL
list_data[3] <- "Updated Element"

# **Exercise**: Take a look at the objects we created above (vectors and dataframes). Create a list that contains them (e.g. weekly_meetings, emp.row_merg, x, ..). Give name to the elements, like: col1, col2, etc.. After creating the list, add a new element, that is your name.

# Write your code here:
# **Solution**: 
# You also can merge two `lists`.

# Create two lists.
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")

# Merge the two lists.
merged.list <- c(list1,list2)

# Print the merged list.
print(merged.list)

#Also, you can convert `list` into a `vector`, by simply unlisting it.

# Convert the lists to vectors.
v1 <- unlist(list1)
v2 <- unlist(list2)

print(v1)
print(v2)

## **Load Data** ############

# So far we've learned how to create our own `data.frames` and `vectors`. How about all the data we have stored in `.xlsx`, `.csv`, etc files? One important thing is to correctly set the working directory and check the current working directory.
# 
# **Why is it important?**\
# 1. You may have multiple files located in different folders, so R won't know which one you mean. 2. It would take a lot of time for R to search whole PC to find the file, and we are trying to cut off as much time as we can. Easiest way to set the directory is:

setwd("/Users/taguhi/R classes/R 101/input")
getwd()   # Check your working directory
# or you can set the working directory same folder where your script is located:

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
getwd()


# Now, that we are in the right place (directory) let's load the data. Again the easiest way is:

# data  <- read.csv("L:/Corporate Support Finance/Reporting/IT Finance/QB/CCAR/Tag/R_coding/Class_2/Random_data.csv", header=TRUE)
# data

# If you don't want to change the working directory, but still want to upload files from different directories, you can specify files with their full path. See bellow.

Random_data_fullpath  <- read.csv("/Users/taguhi/R classes/R 101/input/Random_data.csv", header=TRUE)
Random_data_fullpath

# Usual practice is to save the path in one variable and name of the file in the other variable. Then you can use `paste()` or `paste0()` functions to combine them in one.

input_folder <- "/Users/taguhi/R classes/R 101/input/"
input_file  <- "Random_data.csv"
full_name <- paste(input_folder, input_file, sep="")

data  <- read.csv(paste(input_folder, input_file, sep=""), header=TRUE)
head(data, n=10) 

# **Exercise:** Go to the Jive site and download data called: Random_data.csv. Save it in your training folder and then load as we in the above chunk.
# write your code here:

## **Using Pipe (%\>%) Operator**############

# The pipe operator is a special operational function available under the `magrittr` and `dplyr` package (basically developed under magrittr), which allows us to pass the result of one function/argument to the other one in sequence. It is generally denoted by symbol `%>%` in R Programming. Usage of this operator increases, readability, efficiency, and simplicity of your code when you have nested functions in your code loop.

# **Example**

data %>% head(10)
head(data,10)

# For the simple function like `head()` it doesn't make much difference to use pipe operator, but we will see below how it can make code readable.
# **Exercise:** Write the below commands by using pipe operator:

colnames(data)
#write your code here: 


# **Solution:**
data %>% colnames()

## **Basic Data Cleaning**############

### **Intro**############

# Data cleaning is a big topic itself, which is impossible to cover in one introductory class. The aim here is show some basic functions that can be used to explore the dataset and identify potential problems. For more resources, please check [An introduction to data cleaning with R](https://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf). For most of the steps, `dplyr` R package is going to be used. See below the main functions from `dplyr` we are going to work with:
# 
# **Glimpse**\
# **Rename**\
# **Distinct**\
# **Mutate**\
# **Select**\
# **Filter**\
# \
# Data cleaning is process of identifying, correcting or removing inaccurate data for further analysis. In this tutorial we will go through the following steps:
# 
# 1.  Familiarize yourself with the data set
# 2.  Check for structural errors
# 3.  Decide how to deal with missing values
# 
# Let's load a dataset, which has been randomly created for this class.

### **1. Familiarize yourself with the data set**############

# For this exercise we will use the dataset randomly generated for this class. Let's load the data and use `glimpse()` function to get the basic information about the dataset.

input_folder <- "/Users/taguhi/R classes/R 101/input/"
input_file <- "Random_data.csv"

data <- read.csv(paste(input_folder, input_file, sep=""), header=TRUE)

# head(data, 10)
data


# After scrolling over the data, we already see a few problems with data, e.g. I see some missing, blank and inconsistent values, headers are quite long, etc.. Let's explicitly check for the structure of the dataset to gain more understanding.

data %>% glimpse()

# alternative versions: 
# data %>% dplyr::glimpse()
# dplyr::glimpse(data)

# R base version:
# str(data) 

# This shows us that the data has `r nrow(data)` obs./rows and `r ncol(data)` variables/columns.
# 
# You can also use the `View(data)` function to see the whole dataset in a separate window in R.
# 
# **Exercise**: Visit the Jive site and download the dataset: Use \`\``glimpse()`\`\`\` to explore the dataset. Do you see any problems with the dataset?

# Your code here:


### **2. Check for structural errors**############

# Some of the most popular errors are:

#### **a) Mislabeled Variables.**############

#   We can check the names of the variables by calling function `names()`.

# names(data) 
# Note that the spaces in the names are indicated with dots. Some of the names are too long. Short names are easy to work with or call in functions, etc. Let's rename them.

data <- dplyr::rename(data, self_employed=names(data)[1])
data <- dplyr::rename(data, company_size=names(data)[2])

# rename the rest by one function: 
data <- dplyr::rename(data, IT_company=names(data)[3],
                      grad_degree=names(data)[5],
                      work_difficulty=names(data)[7],
                      remote_work=names(data)[13],
                      ID="Employee_ID")

# **Exercise:** Let's keep consistency and rename all Upper case letters in the columns to Lower case. Write your code bellow:
# # Your code here:


# ** Solutions**: 
data <- dplyr::rename(data, salary=Salary,
                      bonus=Bonus,
                      age=Age,
                      overtime=Overtime,
                      gender=Gender,
                      country=Country,
                      role=Role)

# **Note:** There is a slight difference when you filter using select and using base R version functions. Using `dplyr::select()` will give you back DataFrame again.

# You can filter by rows and columns to see in more details a particular column:
df_filtered_1 <- data %>% dplyr::select(self_employed) 
df_filtered_1 <- data %>% select(self_employed) # this is a dataframe extracting from data (dataframe)
df_filtered_1 %>% class()


# dplyr::glimpse(select(data,Bonus))
# base R version:
# df_filtered_2 <- data[,"self_employed"] # this is vector extracted from a data (dataframe)
# class(df_filtered_2)

# Let's check on the names of Data:

# names(data)


#### **b) Incorrect data types**############

# You can check the types with `glimpse()` function as mentioned above, or another way of doing it is too use `typeof()`.

class(data$ID)
class(data$company_size)

# It returns as integer value, but in fact it must be `character` for `ID` and `factor` for `company_size`. Let's correct for that.

data$ID <- as.character(data$ID)
data$company_size <- as.factor(data$company_size)

class(data$ID)
data$company_size %>% class()


#### **c) Non-unique ID numbers or Duplicate data**############

# Our dataset have `ID` labels, which is unique to each respondent. We can check if the data contains duplicate values and remove them. See below 2 functions that can serve the purpose: `duplicated()` or `distinc()` function from `dplyr` package.

data <- dplyr::distinct(data, ID, .keep_all = TRUE)
data
# dplyr::glimpse(data)

#Base R version
# data1 <- data[!duplicated(data), ]    # you definitely don't need repetitive rows
# data1 <- data[!duplicated(data$ID), ] # it also seems incorrect to have several data for the same person

# dplyr::glimpse(data1)



# You can verify that two datasets return the same results.

#### **d) String inconsistencies**############

#This includes typos, capitalization errors, misplaced punctuation, or similar character data errors that might interfere with data analysis. Take for instance our `country` column and let's check for the unique values there:


data %>% select(country) %>% distinct()

# dplyr::distinct(data,country)
# dplyr::distinct(select(data,country))

# see also for R base
# unique(data$country)



#Easy to see that we have some mistyped values. To correct for them, let's use simple `recode` function.
data <- data  %>% mutate(country=recode(country, "BelgiuM"="Belgium",
                                        "Cada"="Canada",
                                        "NetherlandS"="Netherlands",
                                        "BraZil"="Brazil"))





# **Exercise:**. Correct for the rest of the country names: 
# Your code here:


data <- data  %>% mutate(country=recode(country, "NetherlandS"="Netherlands",
                                        "BraZil"="Brazil"))



# alternative version
# data$country <- dplyr::recode(data$country,
#                               "BelgiuM"="Belgium",
#                               "Cada"="Canada",
#                               "NetherlandS"="Netherlands",
#                               "BraZil"="Brazil")



data %>% dplyr::distinct(country)
# dplyr::distinct(select(data,country))
# dplyr::distinct(data,country)


# Similarly, let's check for columns gender.

# data %>% dplyr::distinct( gender)
data %>% distinct(gender)

# There are 15 distinct values, where as in fact you can see only 4 (`Male` `male` `m` `M` `man` indicate same gender identification but differ due to inconsistent capitalization, term abbreviation, etc.). You can of course use `replace()/recode()` functions mentioned above, and specify for each of the value what the replacement should be. But there is much more efficient way to deal with string by utilizing Regular expressions (`RegEx`). Regular expressions with combination of a few functions like `gsub()`, `grep()`, `sub()`, .. etc is a powerful tool to use in dealing with `character` type data. In our simple example let's substitute `Female` with `1`, and `Male` with `0`.
# 
# With `RegEx` it goes like:

# data1 <-data
data$gender <- gsub("^F[a-zA_Z0_9 \\.]+|F", "1", data$gender,ignore.case =TRUE )
data$gender <- gsub("^M[a-zA_Z0_9 ]+|M", "0", data$gender,ignore.case =TRUE)

# ^ matches start of each line
# [] grouping of characters:
# escape
# + can be 1 or more character

dplyr::distinct(data, gender)
# unique(data$Gender)

# We are not going to study Regular Expressions in this course. If you want to learn more about them, please check: [Regular expressions](https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html)

### **3. Decide how to deal with missing values**############

# There is no single "best" way to deal with missing values in a data set. let's take a look at missing values in our dataset.

sum(is.na(data))
which(is.na(data))
colSums(is.na(data))
head(is.na(data), n=5)

# 
# R records the values missed if they are explicitly stated as `NA`. If data is just not there, R doesn't understand it as missing data. For us the data that is not recorded we treat as missing data, so let's tell R to explicitly do that.
# 
# **Exercise** Please write the above commands using pipe \``%>%`.
# your code here

## **Solution**
data %>% is.na() %>% sum()
data %>% is.na() %>% which()
data %>% is.na() %>% colSums()
data %>% is.na() %>% head(5)

# Sometimes missing values are not explicitly captured. Sometimes empty values are not captured as missing, but we can tell R to treat empty values as missing as shown below.

data[data==""] <- NA


# Now that we check for the missing values, we see totally different picture:

sum(is.na(data))
which(is.na(data))
colSums(is.na(data))
head(is.na(data), n=5)


data %>%  dplyr::filter_all(any_vars(is.na(.)))
dplyr::filter_all(data, any_vars(is.na(.)))
data %>%  dplyr::filter_all(any_vars(is.na(.))) %>% is.na() %>% colSums()

# You can delete rows or columns with missing values, replace them with mean, max, min or latest recorded values. You can impute the missing values using some logical rule, algorithms or predictive methods such as linear regressions, but they are not the topic of our class.
# 
# Looking at the summary of data, we notice that there is no missing value for `role`, but we have `r sum(is.na(data$IT_company))`. In cake of this exercise, let's assume if a person has IT role, then he/she is working for IT company. Same way you can tell R to treat any value that you think is incorrect as missing value.

data %>% dplyr::select(IT_company, role)

data %>% dplyr::select(IT_company, role) %>%  filter(is.na(IT_company))


data %>% dplyr::select(IT_company, role) %>%  filter(is.na(IT_company), role=="Front-end Developer"|role=="Back-end Developer"|role=="Developer")

data <- data %>% mutate(IT_company=replace(IT_company, role=="Front-end Developer"|role=="Back-end Developer"|role=="Developer"|role=="DevOps", 1))

data <- data %>% mutate(IT_company=replace(IT_company, role=="dantist", 0))

# base R version:
# data$IT_company[is.na(data$IT_company)&(data$role=="Front-end Developer"|data$role=="Back-end Developer"|data$role=="Developer")] <- 1

# **Exercise**: Below substitute missing values in salary column with average salary.

mean.salary <- mean(data$salary, na.rm = TRUE)

data %>% select(salary) %>% filter(is.na(salary))
# write you code here:


#**Solution**

data %>% select(salary)
data <- data %>% dplyr::mutate(salary=replace(salary, is.na(salary),mean.salary))


# **Exercise:** Replace the missing values in column overtime with "Maybe". Write your code below.

# write your code here:
# solution
data %>% select(overtime)
data <- data %>% mutate(overtime=replace(overtime, is.na(overtime), "Maybe"))
data %>% select(overtime)

# data$overtime[is.na(data$overtime)] <- "Maybe"


# **Home Exercise:** Take a look at the rest of the columns and decide what you want to do with missing values there. Write your answer in the box below:
# Your code here:

# An finally you can drop all the rows that contain missing data.

data <- data %>% na.exclude()


## **Save Data**############

# We saw how to upload data, how about saving data into a specific folder ? In R you can change the directory and save the data in that (working) directory, or you give full path with file name and save it without changing the working directory. See below:

write.csv(data, "random_data_cleaned.csv")
write.csv(data, "/Users/taguhi/R classes/R 101/output/random_data_cleaned.csv")

## **Optional: Built in Data**############

# R also has a lot of built in data in case you want to practice with them. To see the list of all built in data use the below command:

# data()                  # all built in datasets in loaded packages
head(ls("package:datasets"), 5) # all available datasets

# Let's look at the dataset called `mtcars`.

data_mtcars <- data(mtcars) # uploads the data
class(mtcars)   #  the type of the object
str(mtcars)  # structure of the data
head(mtcars) # shows first 6 lines of dataset

