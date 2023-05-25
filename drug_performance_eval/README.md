# Drug Performance Evaluation with RShiny

**Brief summary:**

In this project, the performance of drugs in six forms (tablet, capsule, cream, liquid (drink), liquid (inject), and other) has been investigated based on the customer ratings: effective, ease of use, satisfaction, and average price. 
For this purpose, a Shiny dashboard had been created in R with two menu items: one for descriptive statistics and the second one for correlation analysis. 

Here is a screenshot of the RShiny dashboard:

<p align="center">
<img src="https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/dashboard_screenshot.png">
</p>

Prior to the exploratory data analysis the data set has been downloaded from [Kaggle](https://www.kaggle.com/datasets/thedevastator/drug-performance-evaluation), cleaned, formatted, and preprocessed to include only the columns. 

The visualizations are stored in the directory [results](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/drug_performance_eval/results), and can be easily accessed by clicking on the headers/sections of the Results part. 

The complete code is given in the file [r_script.R](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/r_script.R), whereas the corresponding documentation is given in the file [code_documentation.Rmd](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/code_documentation.Rmd).

<hr>

### TABLE OF CONTENTS:
* [Results](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/drug_performance_eval#results)
* [Outlook](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/drug_performance_eval#outlook)

 
## Results

### [Descriptive statistics](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/drug_performance_eval/results/descriptive_statistics)

[**Effective**](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/descriptive_statistics/effective.pdf)

From the summary of the distribution on customer ratings for how effective the drugs are based on their form, several observations can be made:

* The highest median effectiveness rating is observed for Liquid (Drink) with a value of 3.83, followed by Cream with a median rating of 3.75.

* Capsule and Tablet have similar median ratings, both around 3.53-3.60.

* Liquid (Inject) and Other have slightly lower median ratings, ranging from 3.44 to 3.52.

* The standard deviation values indicate that Cream and Liquid (Drink) have lower variability in effectiveness ratings, suggesting more consistent experiences among users.

* Overall, Cream and Liquid (Drink) appear to have higher effectiveness ratings compared to the other drug forms.

[**Ease of use**](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/descriptive_statistics/ease_of_use.pdf)

By comparing the summary statistics for the ease of use ratings, the following observations can be drawn:

* Overall, the ratings for the ease of usage are relatively high for all drug forms, with median ratings ranging from 3.55 to 4.21 and mean ratings ranging from 3.289 to 4.04.

* Liquid (Drink) and Cream have received slightly higher median and mean ratings compared to Capsule and Tablet, indicating that customers generally found them easier to use.

* Liquid (Inject) has the lowest median and mean ratings, suggesting that customers found it relatively less easy to use compared to the other drug forms.

* Other drug form has similar median and mean ratings to Capsule, indicating that customers found them equally easy to use.

[**Satisfaction**](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/descriptive_statistics/satisfaction.pdf)

By comparing the summary statistics for the satisfaction ratings, the following observations can be drawn:

* The highest median satisfaction rating is observed for Liquid (Drink) with a value of 3.57, followed closely by Cream with a median rating of 3.55.

* Capsule and Tablet have similar median ratings, both around 3.10-3.13.

* Liquid (Inject) has the lowest median rating at 3.00, indicating comparatively lower satisfaction among users.

* The standard deviation values suggest that Liquid (Inject) and Other have higher variability in satisfaction ratings, indicating more diverse opinions among users.

[**Average price**](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/descriptive_statistics/price.pdf)

By comparing the summary statistics for the reported average price of the drugs, the following observations can be drawn:

* Prices vary significantly within each drug form, as indicated by the wide ranges and standard deviations.

* Capsule and Tablet have relatively lower average prices compared to Cream, Liquid (Inject), and Other.

* Liquid (Drink) has the lowest median and mean price among the drug forms.

* Cream and Liquid (Inject) have higher average prices compared to the other drug forms.


Based on these observations, some general conclusions can be made:

* Cream and Liquid (Drink) appear to be preferred drug forms based on the relatively higher effectiveness, ease of use, and satisfaction ratings.

* Liquid (Drink) drugs might also be more preferred due to their lower average prices.

* Liquid (Inject) may have lower preference due to its lower effectiveness ratings and higher average price.

It is, however, important to note that these conclusions have been made solely based on the provided ratings. 
As individual preferences may vary based on specific needs, conditions, and personal preferences, 
additional factors such as side effects, convenience, and specific medical requirements should also be taken into account when determining the preferred drug form for a particular situation.

### [Statistical inference](https://github.com/arjeta-rushiti/data-science-portfolio/tree/main/drug_performance_eval/results/statistical_inference)

Based on the [Spearman](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/statistical_inference/spearman_correlation.pdf) ([Kendall](https://github.com/arjeta-rushiti/data-science-portfolio/blob/main/drug_performance_eval/results/statistical_inference/kendall_correlation.pdf)) rank-based correlation coefficients, the following relationships can be observed:

* **Effective vs. Ease of Use**: The correlation coefficient of 0.636*** (0.502***) indicates a moderate positive correlation between the effectiveness and ease of use ratings. This suggests that drugs with higher effectiveness tend to have higher ratings for ease of use. The linear-like scatter plot also supports this positive relationship.

* **Effective vs. Satisfaction**: The correlation coefficient of 0.838*** (0.699***) indicates a strong positive correlation between the effectiveness and satisfaction ratings. This implies that drugs with higher effectiveness are associated with higher levels of satisfaction. The linear-like scatter plot further confirms this strong positive relationship.

* **Effective vs. Price**: The correlation coefficient of -0.036 (-0.024) suggests a very weak (almost none) negative correlation between the effectiveness and price ratings. This indicates that there is no meaningful relationship between the effectiveness of drugs and their price.

* **Ease of Use vs. Satisfaction**: The correlation coefficient of 0.645*** (0.501***) indicates a moderate positive correlation between the ease of use and satisfaction ratings. This implies that drugs that are easier to use tend to be associated with higher levels of satisfaction. The linear-like scatter plot supports this moderate positive relationship.

* **Ease of Use vs. Price**: The correlation coefficient of -0.140*** (-0.098**) suggests a weak negative correlation between the ease of use and price ratings. This suggests that drugs that are easier to use are slightly associated with lower prices.

* **Satisfaction vs. Price**: The correlation coefficient of -0.107** (-0.072**) suggests a weak negative correlation between the satisfaction and price ratings. This implies that drugs with higher levels of satisfaction tend to be associated with slightly lower prices, although the strength of the relationship is weak as indicated by two asterisks.

The *** indicates that the correlation coefficients are statistically significant at a very high level of confidence, suggesting that the observed correlations are highly unlikely to be due to random chance, whereas the absence of an asterisk indicates that the correlation is not statistically significant. 

## Outlook 
The scatter plots make it easy to see the kind of the relationships present in the data. In addition, they provide insight into the strength and direction of the relationship, which is then confirmed with the calculated correlation coefficients.
However, the correlation coefficients only measure the strength of the association, not its magnitude (i.e., how much does one variable increase or decrease with increasing values of the other). Moreover, relationships between more than 2 variables simply can’t be assessed using a basic correlation coefficient.

To  assess relationships involving multiple explanatory variables one can perform linear regression analysis by producing a line which best fits the data. 
Furthermore, linear regression analysis provides with the R-squared value and the slope of the relationship between the variables, which can then be used to make predictions. 
