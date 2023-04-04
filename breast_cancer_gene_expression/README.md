# Breast Cancer Multi-Class Classification with Keras
<hr>

**Core of the investigation:** machine learning study focused on cancer research

**Rough goals of the work:** training a neural network for cancer classification using gene expression data

**NOTE:**

**Install dependencies using requirements.txt**

**Full Python code is shown in pythonscript.ipynb**

### TABLE OF CONTENTS:
<hr>

* [Description of the relevance of the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#description-of-the-relevance-of-the-topic)
* [Personal interest in the topic](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#personal-interest-in-the-topic)
* [State of research](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#state-of-research)
* [Knowledge gap](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#knowledge-gap)
* [Objectives / Posing questions](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#objectives--posing-questions)
* [Methodology](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#methodology)
* [Results](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#results)
* [Outlook](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/breast_cancer_gene_expression#outlook)


### Description of the relevance of the topic

Cancer is the second leading cause of mortality worldwide (after cardiovascular illnesses), hence its early detection is critical. To this end, changes in gene expression can be used as insightful markers for cancer diagnosis and progression. Monitoring of gene expression is most commonly done using the deoxyribonucleic acid (DNA) microarray technique or the next-generation sequencing (NGS) method, which allow for the simultaneous estimation of thousands of gene expressions. This abundance of data has motivated scientists to explore possibilities of cancer classification using gene expression data. That being said, cancer characterization involves measuring levels of gene expression in a large number of genes in cancer samples, resulting in data which is high-dimensional and difficult to interpret using traditional statistical methods. To aid in gene expression analysis, machine learning (ML) approaches, have been frequently used for cancer classification because they can help identify patterns and relationships in the gene expression data that may not be immediately apparent to a human expert.


### Personal interest in the topic

From the different types, female breast cancer is one of the most often detected forms of cancer and although it is one of the best characterized malignant diseases, it has a high death rate. Therefore, early and accurate classification of breast tumors is critical for patient treatment. As previously mentioned, nowadays, cancer classification predominantly relies on the application of omics approaches, being able to analyze thousands of gene sequences and transcripts in a single experiment. I am thus interested in analyzing datasets of gene expression data from breast cancer samples and to deploy ML with the aim of distinguishing between different types of breast cancer based on their gene expression profiles.

### State of research
In 2019, an extensively Curated Microarray Database (CuMiDa, [https://sbcb.inf.ufrgs.br/cumida](https://sbcb.inf.ufrgs.br/cumida)), composed of 78 handpicked data sets for Homo sapiens that were carefully examined from more
than 30 000 microarray experiments from the Gene Expression Omnibus, was created solely for benchmarking and testing of ML approaches applied to cancer research. 

Several algorithms were tested using the default parameters and the Waikato Environment for Knowledge Analysis (WEKA) program and evaluated using stratified 3-fold cross validation. From the classification algorithms the performance of the following was tested:

* SVM : Support Vector Machine
* DT : Decision Tree
* RF : Random Forest
* NB : Naives Bayes
* MLP : MultiLayer Perceptron with a single hidden layer (10 nodes)
* KNN : K-Nearest Neighbor
* ZeroR classifier

whereas from the clustering algorithms:

* KM : K-Means
* HC : Hierarchical Clustering

were considered.

Prior to testing, principal component analysis (PCA) with two components was applied to the original data sets using the scikit-learn Python library.

### Knowledge gap

In the [CuMiDa database](https://sbcb.inf.ufrgs.br/cumida), there are 13 data sets which correspond to breast cancer samples. While
most of them have high accuracy baselines, the data set under the ID ’GSE26304’ has a benchmark
accuracy lower than 40 % :

![cumida_benchmark.png](attachment:cumida_benchmark.png)

This data set corresponds to a breast cancer study which has 4 classes and over 30 000 features.

### Objectives / Posing questions
Motivated by the low accuracy of the ’conventional’ ML algorithms for microarray analysis for the data set with the ID ’GSE26304’, in this project I intend to build a ML model, specifically, a neural network (NN) with an improved accuracy relative to the CuMiDa classifiers. 

The specific question I aim to answer is:

* How to beat the classification and clustering benchmarks for the ’GSE26304’ dataset listed on the CuMiDa website?

### Methodology

A NN model with an input layer of 115 units, a single hidden layers with 12 units, and one output layer with 4 units has been constructued for the classification of breast cancer using gene expression data. 
EarlyStopping and Dropout with rate 20 % have been applied as regularization techniques to avoid overfitting. 
The model has been validated using stratified 3-fold cross-validation.

The overall methodology can be divided in four steps as follows:

1. importing libraries and modules <p></p>

2. data loading and preprocessing <p></p>
    
3. building the NN model <p></p>
    
4. evaluating the NN model <br>
    
### Results

The NN model with the architecture described above was trained for the classification of breast cancer types using gene expression data. 
The model has been validated using 3-fold cross-validation to yield **mean accuracy of around 65 %'**, which is an improvement over the ML learning algorithms listed on the [CuMiDa database](https://sbcb.inf.ufrgs.br/cumida).

### Outlook 
Even though the NN model built in this project performs much better than the ’conventional’ ML algorithms listed in the [CuMiDa database](https://sbcb.inf.ufrgs.br/cumida), there is still room for improvement of the accuracy over 65 %.
To this regard, one can optimize the model by tuning the hyperparameters, such as the number of hidden layers, number of nodes in each hidden layer, the dropout rate, and so on. 
Ideally, the dataset could also be improved to include more samples.
These interventions might yield higher accuracy of the NN model which would allow for its usage in a real-world setting.
