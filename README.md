# Data-Analyst-Project


https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link  

My project was to develop data exploration and visualisation skills by working through a guided project on YouTube. However, my attempt wasn't simply following a tutorial, copying & pasting queries and clicking the correct buttons. No, I found there was significantly more data cleaning and wrangling required, my approach is expanded upon below.  

The project allowed me to put into practice, data cleaning, data wrangling, creating queries, and data visualisation skills which went on to help me with a lot of the SQL work I have done since this initial project.  

![alt text](https://github.com/Stuzanna/Data-Analyst-Project/blob/main/Images/TableauDashboard.png)
Source videos by Alex the Analyst: https://youtu.be/qfyynHBFOsM , as well as the visualisation in part2 video: https://youtu.be/QILNlRvJlfQ.  
This repo will be useful for anyone attempting the video using MySQL rather than SQL Server or who wants to see some of the problems that are perhaps glanced over in the video.


## Approach

A summary of the approach was to;
1. Download a set of public data (Covid data from: https://ourworldindata.org/covid-deaths)
2. Learn how to install and deploy a MySQL database to my local machine
4. Write a script in SQL to import and clean the data
5. Explore the data using queries
6. Visualising the data; exporting from SQL to Excel to be used in Tableau Public
7. Work within Tableau Public to create a dashboard: https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link 

The below will detail some of the stages and share some of the notes I took as part of the project.

### Data Import

This proved troubling, after some investigation the issue was Excel would save .csv as ASCII when my SQL analysis tool was expecting UTF-8. Saving the csv in Excel in UTF-8 solved the issue.

### Data Cleaning

This was the most time consuming part of the project and not meant to be part of the project, a great learning opportunity. There was missing columns, missing values and wrongly formatted dates, all typical cleaning problems. Some of the missing values were from the import creating `EMPTY` values, which I discovered is different to `NULL` values! The date format was wrong type (text) and wrong format requiring date conversion from DD/MM/YYYY to YYY-MM-DD.

## Repo Structure

`Clean` files for starting afresh with the data for when things go wrong, these generate tables.  
`Query1.sql` is for the data exploration, `QueriesPart2` is for fetching and preparing the data for the visualisation.  
`Temp` files were for working queries to help troubleshoot and explore other items.

## Try it yourself

If you wish to run a version of this yourself you can, download the data from the [our world in data(https://ourworldindata.org/covid-deaths), bring the data into your SQL database, run the cleanup script, use queries in QueriesPart2 (make minor adjustments based on your data, using comments as a guide). You'll now have tables prepared for visualisation in Tableau.


# Conclusion

The project was an enjoyable push, I ended up spending more time on learning to do database admin installing MySQL than intended. Gained valuable experience cleaning the data and finding the best ways to write & execute SQL queries. Tableau was interesting to use and there is probably a lot more to get into with this and data visualisation in general.

Start, dataset: https://ourworldindata.org/covid-deaths  
End, Tableau dashboard: https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link   
