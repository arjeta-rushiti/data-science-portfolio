# Identifying Targets Associated with Liver Diseases from ChEMBL Database

**Core of the investigation:** identifying the top target types associated with liver diseases in humans, number of compounds tested against each target type, and their distribution of activities using the ChEMBL database 

**Rough goals of the work:** exploring KNIME and PostgreSQL as powerful platforms for computer-aided drug design, while making the first attempt to work with the ChEMBL database 
<hr>

### TABLE OF CONTENTS:

* [Description of the relevance of the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#description-of-the-relevance-of-the-topic)
* [State of research](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#state-of-research)
* [Personal interest in the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#personal-interest-in-the-topic)
* [Objectives / Posing questions](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#objectives--posing-questions)
* [Methodology](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#methodology)
* [Results](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#results)
* [Outlook](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl#outlook)


### Description of the relevance of the topic

Computer-aided drug design is a critical aspect of modern drug discovery that involves using computational methods to identify and optimize new drug candidates. It allows researchers to use software tools to simulate the behavior of molecules and the screening of large databases of compounds to identify those with the most promising therapeutic potential. This approach saves time and resources compared to traditional experimental methods, and can revolutionize the way drugs are developed and bring new treatments to patients more quickly and efficiently.

### State of research

In 2021, a tutorial which provides an overview of how to use KNIME workflows for computer-aided drug design was published (see [here](https://www.knime.com/blog/tutorials-for-computer-aided-drug-design-using-knime-workflows)).
This tutorial covers the basics of molecular docking and pharmacophore modeling, and shows how to create KNIME workflows for ligand-based virtual screening and protein-ligand docking. In the ligand-based virtual screening workflow, various KNIME nodes and tools are used to prepare the ligand dataset, create a pharmacophore model, and screen for potential lead compounds. The protein-ligand docking workflow covers the preparation of the protein and ligand datasets, and the docking process using the AutoDock Vina tool. Finally, the tutorial discusses how to analyze and visualize the docking results using KNIME tools.
The pipeline is illustrated using the epidermal growth factor receptor (EGFR), but can be applied to other targets of interest. Topics include how to fetch, filter, and analyze compound data associated with a query target. 

### Personal interest in the topic

Motivated by the capabilities of the KNIME Platform for computer-aided drug design, I decided to explore first hand the effectiveness of KNIME nodes in exploring targets associated with liver diseases in humans, while making the first attempt to work with a large and complex database such as, [ChEMBL](https://www.ebi.ac.uk/chembl/), which contains information on millions of molecules, their properties, and activities against various biological.
In combination, I decided to use PostgreSQL as a relational database to store, analyze, and manage the data extracted from the ChEMBL database.

Exploring targets and activity of compounds associated with liver diseases from ChEMBL is can help in identifying potential drug targets and lead compounds for liver disease treatment, as well as in gaining insights into the mechanisms underlying the diseases. Consequently, it can help in the development of more effective and targeted treatments for liver diseases.

### Objectives / Posing questions
To explore the targets associated with liver diseases in humans from the [ChEMBL](https://www.ebi.ac.uk/chembl/) database, the present project tends to investigate the following questions using KNIME and PostgreSQL:

* What are the target types and how many compounds have been tested against each target type associated with liver diseases in humans? <p></p>

* What is the distribution of activities for compounds targeting the top 5 most frequent targets associated with liver diseases, and how does this distribution vary by target type? <br>


### Methodology
This project consists of two parts:
* PART 1: KNIME nodes are used to collect the neccessary data from the ChEMBL database and prepare it for further analysis using SQL queries.

* PART 2: Data is stored in PostgreSQL and the posed scientific questions above have been investigated using queries.

**NOTE:**

**The detailed documentation for the KNIME workflow and the PostgreSQL queries is given in the respective folders, [part_1_KNIME](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl/part_1_KNIME) and [part_2_PostgreSQL](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl/part_2_PostgreSQL), starting with the 'doc' keyword in the filename i.e., doc_*.pdf**

**The preprocessed data from KNIME is uploaded in the [data](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/targets_liver_chembl/data) folder.**

The general KNIME workflow is given in the figure below. 

<p align="center">
<img src="https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/targets_liver_chembl/figures/KNIME_workflow.png">
</p>
 
### Results

This section is divided in terms of the question which were posed.

**QUESTION 1: What are the target types and how many compounds have been tested against each target type associated with liver diseases in humans?**

<p align="center">
<img src="https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/targets_liver_chembl/figures/targets_cmpounds.png" width=30% height=30%>
</p>

**QUESTION 2: What is the distribution of activities for compounds targeting the top 5 most frequent targets associated with liver diseases, and how does this distribution vary by target type?**

For demonstration, here, only the first 15 rows from the output are given:

<p align="center">
<img src="https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/targets_liver_chembl/figures/distribution_activities.png">
</p>

### Outlook 
As a low-code data analytics platform, KNIME integrates various components for data manipulation, visualization, and machine learning operations. 
Furthermore, KNIME provides a wide range of nodes and tools for cheminformatics, including tools for molecular descriptor calculation, ligand-based virtual screening, protein-ligand docking, and chemical structure visualization.
Therefore, a whole standalone project could be designed and solved solely using KNIME nodes. However, this is beyond the scope of the present project, which is more general and intends to leverage the strengths of two platforms KNIME and PostgreSQL for drug discovery workflows. 

A third part of the poject could also be integrated, which would focus on the visualization of the results using KNIME or some other bussiness intelligence (BI) tool, such as Tableau. 
For instance, one could use a bar chart to display the number of compounds tested against each target type associated with liver diseases. For the second question, one could use a box plot to show the distribution of activities for compounds targeting the top 5 most frequent targets associated with liver diseases, and then use color coding or small multiple charts to show how the distribution varies by target type. 
Filters can also be added to explore the data based on specific criteria such as target types and compound activities.
