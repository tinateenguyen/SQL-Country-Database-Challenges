SQL Country Database Challenges
Save your queries in a file if you want to keep them for posterity.


SELECT * FROM country

WHERE

What is the population of the US? (HINT: starts with 2, ends with 000)
SELECT population FROM country WHERE name = 'United States'

What is the area of the US? (starts with 9, ends with million square miles)
SELECT surfacearea FROM country WHERE name = 'United States'

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (all 37 of them)
SELECT name FROM country WHERE continent = 'Africa' AND population < 30000000 AND lifeexpectancy > 45

Which countries are something like a republic? (are there 122 or 143 countries or ?)
SELECT name FROM country WHERE governmentform LIKE '%Republic%'


Which countries are some kind of republic and acheived independence after 1945?
SELECT name FROM country WHERE governmentform LIKE '%Republic%' AND indepyear > 1945


Which countries acheived independence after 1945 and are not some kind of republic?
SELECT name FROM country WHERE governmentform NOT LIKE '%Republic%' AND indepyear > 1945



ORDER BY

Which fifteen countries have the lowest life expectancy? highest life expectancy?
SELECT name FROM country ORDER BY population ASC LIMIT 15
SELECT name FROM country ORDER BY population DESC LIMIT 15



SELECT

Which five countries have the lowest population density? highest population density?
SELECT name FROM country ORDER BY population/surfacearea ASC LIMIT 5
SELECT name FROM country ORDER BY population/surfacearea DESC LIMIT 5

Which is the smallest country, by area and population? the 10 smallest countries, by area and population?
WITH smallest AS(
    SELECT * FROM country ORDER BY surfacearea ASC LIMIT 10)
SELECT * FROM smallest ORDER BY population ASC LIMIT 10

Which is the biggest country, by area and population? the 10 biggest countries, by area and population?
WITH largest AS (
	SELECT * FROM country ORDER BY surfacearea DESC LIMIT 10)
SELECT * FROM largest ORDER BY population DESC LIMIT 10



WITH

Of the smallest 10 countries, which has the biggest gnp? (hint: use WITH and LIMIT)
WITH smallest AS (
    SELECT * FROM country ORDER BY population ASC LIMIT 10)
SELECT * FROM smallest ORDER BY gnp DESC LIMIT 1

Of the smallest 10 countries, which has the biggest per capita gnp?
WITH newColumn AS (
    SELECT * FROM country ORDER BY population ASC LIMIT 10)
SELECT * FROM newColumn ORDER BY gnp/capital DESC LIMIT 1

Of the biggest 10 countries, which has the biggest gnp?
WITH newColumn AS (
    SELECT * FROM country ORDER BY population DESC LIMIT 10)
SELECT * FROM newColumn ORDER BY gnp DESC LIMIT 1

Of the biggest 10 countries, which has the biggest per capita gnp?
WITH newColumn AS (
    SELECT * FROM country ORDER BY population DESC LIMIT 10)
SELECT * FROM newColumn ORDER BY gnp/capital DESC LIMIT 1


What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?


GROUP BY
How big are the continents in term of area and population?
Which region has the highest average gnp?
Who is the most influential head of state measured by population?
Who is the most influential head of state measured by surface area?
What are the most common forms of government? (hint: use count(*))
What are the forms of government for the top ten countries by surface area?
What are the forms of government for the top ten richest nations? (technically most productive)
What are the forms of government for the top ten richest per capita nations? (technically most productive)
Interesting...
Which countries are in the top 5% in terms of area?
(hint: use a SELECT in a LIMIT clause)

When is the database from?

Stretch Challenges
What is the 3rd most common language spoken?
How many cities are in Chile?
What is the total population in China?
How many countries are in North America?
Which countries gained their independence before 1963?
What is the total population of all continents?
What is the average life expectancy for all continents?
Which countries have the letter z in the name? How many?
What is the age of Jamaica?
Are there any countries without an official language? Hint: WHERE ... NOT IN ( SELECT ... FROM ... WHERE ...)
