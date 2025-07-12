# Predicting Medical Insurance Premiums with Machine Learning

This data science project designed to predict medical insurance premium prices based on customer health profiles. By combining statistical modeling, tree-based machine learning, and unsupervised clustering, this project identifies key drivers of premium variation and proposes data-driven strategies for personalized pricing.

The dataset contains 986 observations and includes variables such as Age, BMI, Chronic Disease History, Transplant History, Family Cancer History, and more. Through rigorous preprocessing, model experimentation, and segmentation analysis, MedPremiumAI demonstrates how predictive analytics can enhance insurance underwriting and client risk stratification.

## Motivation
Accurate medical premium pricing is crucial for fair insurance underwriting and financial sustainability. Traditional methods often fail to capture the complex, nonlinear relationships between patient characteristics and insurance costs.

This project addresses a critical challenge: **Can we reliably predict medical premiums and segment clients into risk tiers using data science, and how can insurers leverage these insights for smarter pricing strategies?**

By integrating regression, machine learning, and clustering methods, this project seeks to modernize the premium prediction process and support healthier, more equitable insurance practices.


## Machine Learning Methods and Results
### Statistical and Regression Models

- Stepwise Regression identified key predictors: Age, Chronic Disease, Transplant History, Weight, Family History of Cancer, and Major Surgeries.

- Lasso and Ridge Regression models achieved ~65.8% R², effectively explaining variation in log-transformed premium prices.

### Tree-Based Machine Learning Models:
- Decision Tree Regression: R² ≈ 0.776 on test data.

- XGBoost Regression: R² ≈ 0.803 on test data, outperforming simpler models.

- XGBoost captured nonlinear effects and improved prediction accuracy across premium price ranges.

### Clustering Analysis
- K-Means Clustering (k = 4): Segmented clients into Low Risk, Moderate Risk, High Risk, and Very High Risk tiers. This enabled targeted risk stratification for differentiated pricing strategies.

## Recommendations
- Multi-Tiered Premium Structures: Align premium rates with risk cluster assignments (Low to Very High Risk).

- Incentive-Based Discounts: Offer wellness program discounts to lower-risk clients and promote healthier lifestyles.

- Dynamic Pricing Models: Integrate real-time health updates (e.g., chronic disease management) into pricing recalculations.

- Enhance Interpretability: Use SHAP values and feature interaction models to improve transparency and compliance with regulatory standards.

- Expand Socioeconomic Features: Incorporate broader data (income, education) to ensure pricing fairness and minimize bias.


## Conclusion
This project  showcases how data science can transform traditional insurance pricing through predictive modeling and customer segmentation.

Key takeaways:
- XGBoost outperformed other models in predicting premiums.
- Risk tiers enable actionable segmentation for insurers.
- Age, health conditions, and surgical history are the dominant drivers of premium variability.

Future work will explore ensemble methods like Random Forests, fairness-aware audits, and deployment of a real-time predictive dashboard for operational use.

By embracing machine learning insights, insurance companies can design fairer, smarter, and more profitable premium systems—benefiting both their clients and their bottom lines.

You can click to view our [presentation](Final%20Presentation.pdf) and the [code](Medical-Premium-Price-Prediction-Final-Project.Rmd). 

## Future Work: Interactive R Shiny Medical Premium Price Prediction Dashboard using XGBoost

To get started, simply enter your personal and medical information, including age, weight, height, transplant history, chronic conditions, cancer history in the family, and number of major surgeries. Once completed, click “Predict Premium” to generate your estimated annual medical insurance premium.

Your result will include a predicted premium amount, for example, $45,500, along with a Risk Tier classification. This tier reflects your overall health-related financial risk. If your premium is below $20,000, you fall into the Low Risk category. Premiums between $20,000 and $30,000 are considered Moderate Risk, while those between $30,000 and $40,000 are High Risk. Anything above $40,000 is classified as Very High Risk, indicating multiple or severe health factors.

The premium is calculated using a machine learning model (XGBoost) trained on historical health and insurance data. Each health factor is assigned a specific weight. For instance, transplants may add $9,000, chronic diseases $7,500, and major surgeries $5,000. These weighted values are added to a base premium of $15,000. Your Body Mass Index (BMI) also affects the outcome: a normal BMI (18.5–24.9) keeps the premium unchanged, while being underweight, overweight, or obese applies a multiplier that may increase your final cost by 10–50%.

You’ll also see a bar chart highlighting the most influential risk factors specific to your profile. Once the results are displayed, you can download a CSV report containing all your inputs, calculated BMI, risk tier, and final premium for future reference.

[![Dashboard Screenshot](/assets/dashboard.png)](https://erika-data.shinyapps.io/Medical-XGBoost-Premium-Price-Predictive-Dashboard/)

**You can click on the dashboard to interact with it.**







