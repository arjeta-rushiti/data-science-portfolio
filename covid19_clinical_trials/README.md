# Exploratory Data Analysis on COVID-19 Clinical Trials Dataset

**Core of the investigation:** Data analysis and visualization

**Rough goals of the work:** Dealing with clinical trials data in the healthcare system
<hr>

**NOTE:**

**Install dependencies using requirements.txt**

**Full Python code is shown in pythonscript.ipynb**
<hr>

### TABLE OF CONTENTS:

* [Description of the relevance of the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#description-of-the-relevance-of-the-topic)
* [Personal interest in the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#personal-interest-in-the-topic)
* [State of research](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#state-of-research)
* [Objectives / Posing questions](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#objectives--posing-questions)
* [Methodology](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#methodology)
* [Results](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#results)
* [Outlook](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/covid19_clinical_trials#outlook)


### Description of the relevance of the topic

Clinical trials are research studies on proposed medical treatments with the aim to evaluate their efficacy and safety. The development and approval of novel treatments for a certain medical condition is challenging and time intensive process. To aid in this process, summaries of trial outcomes act as a data source.
For instance, when no effective treatments have been developed for a novel disease, not to seldom, medical researchers rely on drug repurposing, i.e., using / testing existing drugs that are meant for different diseases.
Therefore, it is always useful to explore clinical trials data sets to find out which treatments (if any) have been investigated for a certain condition, what has been proved most useful and what not, how they affect different genders or age groups, and so on.


### Personal interest in the topic

This project deals with a data set of COVID-19 clinical trials being conducted worldwide and compiled in Kaggle (Pandey, 2021): [https://www.kaggle.com/datasets/parulpandey/covid19-clinical-trials-dataset](https://www.kaggle.com/datasets/parulpandey/covid19-clinical-trials-dataset).
The recent global SARS-CoV-2 pandemic caused million cases and deaths worldwide affecting normal life at its core. As a result, researches from all fields focused their efforts on finding effective and safe treatments. Since no vaccine against the virus was at disposal at the beginning of the outbreak, the nature of the medical intervention was based on the patients symptoms, leading to different ways of fighting the disease and numerous emerging clinical studies. Motivated by this, here I investigate the number of emerging COVID-19 clinical trials over years and months, the top locations where the trials took place, the types of studies which were categorized based on gender and age, and the most common treatment types.

### State of research

There are four articles which have used the above-mentioned COVID-19 clinical trials with the purpose of improving and optimizing drug repurposing for the SARS-CoV-2 pandemic:

1. Drug Repurposing using Link Prediction on Knowledge Graphs, DOI: [https://doi.org/10.1007/978-3-030-93413-2_61](https://doi.org/10.1007/978-3-030-93413-2_61)
2. A Multimodal, Multimedia Point-of-Care Deep Learning Framework for COVID-19 Diagnosis, DOI: [https://doi.org/10.1145/3421725](https://doi.org/10.1145/3421725)
3. Improved And Optimized Drug Repurposing For the SARS-CoV-2 Pandemic, DOI: [https://doi.org/10.1101/2022.03.24.485618](https://doi.org/10.1101/2022.03.24.485618)
4. Causal Reasoning in Machine Learning, DOI: [http://dx.doi.org/10.13140/RG.2.2.28958.97602](http://dx.doi.org/10.13140/RG.2.2.28958.97602)

Most common drug interventions have been explored using deep learning, specifically graph neural networks that condense relationships between entities like drugs, diseases, and genes.

### Objectives / Posing questions

The specific question I aim to answer include:

1. When did most of the clinical trials start? <p></p>

2. Which are the top 10 locations where the clinical trials were conducted? <p></p>

3. What type of studies were mostly conducted? <p></p>

4. Were the studies gender specific or did they include all genders? <p></p>

5. Did the studies consider specific age categories? <p></p>

6. What were the most common treatments? <br>

### Methodology

The overall methodology can be divided in five steps as follows:

1. import libraries and modules <p></p>

2. load data <p></p>

3. inspect missing values <p></p>

4. handle missing values and clean the data <p></p>

5. plot data <br>
    
### Results

This section is divided in terms of the question which were posed.

**QUESTION 1: When did most of the clinical trials start?**

The clinical trials have been grouped based on the year they started. From this plot it is clear that the majority of trials (over 4000) started in 2020 with the outburst of the COVID-19 pandemic. Prior to this year there have been ongoing clical trials, but the number is very small compare to year 2020. A significant drop is observed in 2021, where the number of clinical trials is slightly over 1000.

![Start Date Year](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/start_date_year.png)

Zooming in around year 2020, and exploring the beginning of the trials on monthly basis one can identify May 2020 as the month where the majority of clinical trials were registered.

![Start Date Month](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/start_date_month.png)

**QUESTION 2: Which are the top 10 locations where the clinical trials were conducted?**

The top 10 countries where the clinical trials were conducted over years are presented below and the order is as follows: United States, France, Unknown location, United Kingdom, Italy, Spain, Turkey, Canada, Egypt, and China.

![Top Locations](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/top_countries.png)

**QUESTION 3: What type of studies were mostly conducted?**

The next figure displays the nature of the clinical studies and the count number for each category. There are three main categories: interventional, observational, and expanded access, of which the first two dominate.

![Study Types](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/study_types.png)

**QUESTION 4: Were the studies gender specific or did they include all genders?**

To investigate the gender based study types I focused on the dominant clinical trials: interventional and observational. The results categorized based on the gender are presented below and show that the majority of the studies of either type included all genders. However, there are more studies conducted for females than for males, and only very small number or studies did not record or specify the gender.

![Genders](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/study_gender_based.png)

**QUESTION 5: Did the studies consider specific age categories?**

The figure below shows the dominant study types (interventional and observational) categorized by age group. 

In total, there are six age groups:
* Adult and Older Adult
* Child, Adult and Older Adult
* Adult
* Child
* Child and Adult
* Older Adult

Most of the clinical trials have been conducted for adults and older aldults, followed by studies which also includ children. The studies which considered only children, adults, or older adults are significantly limited over the trials which included all categories.

![Age Categories](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/study_age_based.png)

**QUESTION 6: What were the most common treatments?**

Finally, I explored the most common treatments for the dominant study - interventional. 

In total, there are 12 interventional means including the categories ’Other’ and ’Not Specified’, of which the administration of drugs dominates.

![Intervention Types](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/covid19_clinical_trials/results/intervention_types.png)



### Outlook 

Some other aspects which can be analyzed from the COVID-19 clinical trial data set include:

* What drugs were mostly used in the interventional type? <p></p>

* How many people participated in the clinical trials of the different type? <p></p>

* What is the overall status of the clinical trials? <p></p>

* Who are the leading sponsors for the COVID-19 clinical trials? 


