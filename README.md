# Predicting the 2024 U.S. Presidential Election

## Overview

The repository provides forecasts for the 2024 U.S. elections using a "polls of polls" method, which aggregates data from multiple polling sources to generate more accurate predictions. By combining and analyzing these polls, the forecast offers a clearer picture of electoral trends and potential outcomes.

The raw data was downloaded from the website FiveThirtyEight at the following link: https://projects.fivethirtyeight.com/polls/president-general/2024/national/ 

## File Structure

The repo is structured as:

-   `data/01-raw_data` contains the raw data obtained from FiveThirtyEight.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `data/03-mapping_data` contains data of US shapefiles used in mapping. 
-   `models` contains the fitted models. 
-   `other` contains graphs, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. The paper is also generated in html in `paper/paper.html` to show the interactive map.
-   `scripts` contains the R scripts used to simulate, download and clean the data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. In particular, ChatGPT was consulted in the simulation of the data set and for the vizualisation of the analysis data. The entire chat history is available `other/llms_usage`.
