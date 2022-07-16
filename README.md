# Data-Analyst-Project


https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link  

My project was to develop data exploration and visualisation skills by working through a guided project on YouTube, my approach is expanded upon below.  
![alt text](https://github.com/Stuzanna/Data-Analyst-Project/blob/main/Images/TableauDashboard.png)
Source videos by Alex the Analyst: https://youtu.be/qfyynHBFOsM , as well as visualisation in part2 video: https://youtu.be/QILNlRvJlfQ.  
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
7. Work within Tableau Public to create a dashboard: https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link 

The below will detail some of the stages and share some of the notes I took as part of the project.

### Data Import

This was proving troubling but after investigation determined the issue was Excel would save .csv as ASCII when my SQL analysis tool was expecting UTF-8. Saving the csv in Excel in UTF-8 remedied problems.

### Data Cleaning

This was the most time consuming part of the project. Data was missing for continent, the import had created several EMPTY values which I discovered was different to NULL and then had to replace. The date format was wrong and in text so converted this to proper format and from DD/MM/YYYY to YYY-MM-DD.

## Repo Structure

*Clean* files for starting afresh with the data after getting things wrong, will generate tables.  
Query1 is for the data exploration, QueriesPart2 is for getting the data for the visualisation.  
Temp files were for holding temporary queries to help troubleshoot and explore other items.

## Running with new data

If you wish to run a version of this yourself you can, download the data from the *our world in data* link above, bring the data into your SQL database, run the cleanup script, use queries in QueriesPart2 (make minor adjustments based on your data, using comments as a guide). You'll now have tables that can be used in Tableau for the visualisation.


# Conclusion

The project was an enjoyable push, ended up spending more time on learning to do database admin installing MySQL that intended. Gained valuable experience cleaning the data up and finding best ways to write and run SQL queries. Tableau was interesting to use and there is probably a lot more to get into with this and data visualisation in general.

Start, dataset: https://ourworldindata.org/covid-deaths  
End, Tableau dashboard: https://public.tableau.com/views/CovidDataProject_16531289748970/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link   
