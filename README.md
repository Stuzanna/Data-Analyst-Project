# Data-Analyst-Portfolio-Project

My project was to develop data exploration and visualisation skills by working through a guided project on YouTube by Alex the Analyst: https://youtu.be/qfyynHBFOsM. As well as visualisation in part2 video: https://youtu.be/QILNlRvJlfQ.
This repo will be useful for anyone attempting the video using MySQL rather than SQL Server or who wants to see some of the problems that are perhaps glanced over in the video.
My attempt wasn't simply following a tutorial, copying & pasting queries and clicking the correct buttons. I found there was significantly more data cleaning and wrangling required.


The project allowed me to put into practice, data cleaning, data wrangling, creating queries, and data visualisation skills.  

## Approach

A summary of the approach was to;
1. Download a set of public data (Covid data from: https://ourworldindata.org/covid-deaths)
2. Learn how to install and deploy a MySQL database to my local machine
4. Write a script in SQL to import and clean the data
5. Explore the data using queries
6. Visualising the data; exporting from SQL to Excel to be used in Tableau Public
7. Work within Tableau Public to create a dashboard: https://public.tableau.com/app/profile/stuart1460/viz/CovidDataProject_16531289748970/Dashboard1?publish=yes 

The below will detail some of the stages and share some of the notes I took as part of the project.

### Data Import

This was proving troubling but after investigation determined the issue was Excel would save .csv as ASCII when my SQL analysis tool was expecting UTF-8. Saving the csv in Excel in UTF-8 remedied problems.

### Data Cleaning

This was the most time consuming part of the project. Data was missing for continent, the import had created several EMPTY values which I discovered was different to NULL and then had to replace. The date format was wrong and in text so converted this to proper format and from DD/MM/YYYY to YYY-MM-DD.


# Conclusion

The project was an enjoyable push, ended up spending more time on learning to do database admin installing MySQL that intended. Gained valuable experience cleaning the data up and finding best ways to write and run SQL queries. Tableau was interesting to use and there is probably a lot more to get into with this and data visualisation in general.

Start, dataset: https://ourworldindata.org/covid-deaths  
End, Tableau dashboard: https://public.tableau.com/app/profile/stuart1460/viz/CovidDataProject_16531289748970/Dashboard1?publish=yes 
