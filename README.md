# Berra-Kurus-Macroeconomic-Analysis-Project
A data analysis project, exploring macroeconomic trends via utilizing R, SQL, and Tableau.
# 📊Macroeconomic Data Analysis

### Choose Your Language / Choisissez Votre Langue :

<details>
<summary><b>🇬🇧 English Report (Click to read the whole report)</b></summary>
<br>

### 1) PURPOSE AND SCOPE OF THE PROJECT:

The primary objective of this project is to analyze macroeconomic trends, perform cross-country comparisons, and find correlations among different variables which are outlined below:

***Core variables:*** GDP growth, inflation, unemployment, youth unemployment, real interest rate, and current account.

These inputs were obtained from World Bank. 22 countries, including G-20 countries, Greece, and Switzerland were represented. The strategic selection criteria behind evaluating this specific group of countries are structured as follows: 

***The Selection Criteria of 22 Countries:*** 

-	G-20 countries dominate global economy. Also, Switzerland is integrated as a financial precursor. Therefore, their existence in the dataset ensures that the analytical insights reflect systemic global trends.
-	The presence of developed as well as developing countries guarantees a balanced analysis.
-	Greece and Spain reflect the macroeconomic dynamics within the European and Mediterranean economic zones.
-	Last but not least, these countries offer reliable, comprehensive, and long-term data series which lead to an extensive investigation.

***Time Interval of the Project***

This analysis is based on an interval of 15 years, commencing from 2010, proceeding until 2024. The indispensable details bringing about this decision are as follows:

-	2010 was determined as the starting year in order for 2008 global financial crisis effects to be examinable.
-	Pandemic years were also incorporated in time interval with the aim of investigating the economic issues stemming from an unprecedently drastic period.
-	2024 was designated as the ending year of the dataset, since 2025 data of multiple countries were still missing, as they are still being finalized.

### 2) TECHNOLOGIES / INFRASTRUCTURE

Various tools and technologies were utilized in order for this project to turn out successfully observable. These include the following programs:

- **R Programming Language:** Data Retrieval via API / Data Cleaning
- **Docker / DBeaver:** Database Hosting (Microsoft SQL Server) / Database Management
- **SQL:** Data Analysis / Correlations / Comparisons
- **Tableau:** Data Visualization

### 3) R

***Installed Packages***

WDI: Data retrieval

tidyverse: Data cleaning / Standardization

***Data Retrieval***

Data was retrieved programmatically using the World Bank API via the WDI package in RStudio, ensuring an automated data pipeline.

***Data Cleaning***

This phase incorporates NA handling and data standardization which were carried out via tidyverse package’s functions in RStudio. 

**NA Handling**

The dataset contained null values, against which taking actions necessitated an overview of what data exactly represented. Accordingly, each NA handling procedure was considered. To preserve data integrity, and because of macroeconomic datasets' unpredictable nature; predictive imputation was not applied. Instead, research methods were used for some countries’ missing values, since the opportunity cost of investigating each null value would be much higher than executing imputation only on key countries’ variables. Therefore; NA values of Greece, Spain, France, Germany, Turkiye, and the USA were rigorously replaced by actual data:

**European Countries (Greece / Spain / France / Germany):**

France, Spain, Greece, and Germany lacked real interest rate data. The reason for such a case is that there is a discrepancy between Euro common monetary policy and IMF’s lending rate standards. To resolve this, the raw data of immediate nominal interest rates for European countries was obtained from FRED (Federal Reserve Bank of Saint-Louis), and it was adjusted by subtracting inflation rate to derive real interest rates. 

**Turkiye:**

Turkiye’s real interest rate data was missing as a result of divergent policies and reporting inconsistencies. Turkiye’s Central Bank (TCMB) and Turkish Statistical Institute do not always provide uninterrupted data flow tailored to the World Bank’s specific index templates. Furthermore, since 2018, Turkiye has pursued negative real interest rate policy resulting in extreme values which are occasionally omitted from international channels in order to preserve data consistency. To obtain indispensable real interest rate data, Central Bank of the Republic of Turkiye’s weekly repo auction rates were utilized to compute nominal interest rates. These values’ inflation-adjusted versions were attached to the dataset. 

**the USA:**

The USA’s 3-year real interest rate data was missing from the initial dataset. To overcome this issue, 1-year annual real interest rate graph was obtained from FRED. There was a discrepancy between the data displayed on the graph and the data of the World Bank. However, a clear parallelism existed in the magnitude of year-over-year increases and decreases between the two sources. Therefore, delta projection method was utilized in order to compute the missing data of 2022, 2023, and 2024 based on FRED’s data.

***Standardization***

To achieve standardization, maintain consistency, and improve readability; all decimal numbers were rounded to two decimal places. Subsequently, the cleaned and standardized version of the initial dataset was exported as a CSV file in order to be queried via SQL.

### 4) SQL

**a) GDP Growth vs Current Account**

**[Click here to view the SQL query](https://github.com/BerraKurus/Berra-Kurus-Macroeconomic-Analysis-Project/blob/main/gdp_current_account_relationship.sql)**

**b) Increase in Inflation**

**[Click here to view the SQL query](https://github.com/BerraKurus/Berra-Kurus-Macroeconomic-Analysis-Project/blob/main/increase_in_inflation.sql)**

*A detailed analysis is being constructed.*

### 5) TABLEAU

***1) Gdp Growth Analyses***

**[Click here to see "Gdp Growth Analyses" dashboard](https://public.tableau.com/views/GdpGrowthAnalyses/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

**Dashboard Explanation**

This dashboard incorporates 5 graphs, 3 of which leverage sheet swapping method for a dynamic user experience. 

**Share of GDP Growth per Country on Total GDP across Years (Top Left):** 

It was intended to find out the contribution of each country to the global growth in order to identify fastest-growing countries around the world.

**Average GDP Growth per Country (Bottom Left):**

This bar chart monitors countries with high and low GDP’s relative to the average global growth reference line.

*Sheet swapping technique encompasses 3 visualizations under the title of “Correlation Graphs” as they unfold relationships between different agents.*

**Current Account vs GDP Growth:**

This line chart was built to display how GDP growth and current account shift simultaneously. Filters for year and country ensure a broader analysis. Especially, by filtering down the years to 2019 and 2021, pandemic-era dynamics could be revealed by pivoting on current account increase despite GDP contractions, as imports decreased more than exports during that specific period.

**GDP Growth vs Real Interest Rate:**

This scatter plot seeks to identify outlier countries deviating from the expected directly proportional relationship between real interest rate and GDP growth.

**GDP Growth vs Unemployment:**

This scatter plot displays inversely proportional relationship between GDP growth and unemployment rate with an integrated trend line.

***2) Macroeconomic Analyses***

**[Click here to see "Macroeconomic Analyses" dashboard](https://public.tableau.com/views/MacroeconomicAnalyses/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

 **Dashboard Explanation**





 *The detailed analysis report is currently being constructed.*

</details>

<details>
<summary><b>🇫🇷 Rapport Français (Cliquez pour lire le rapport en entier)</b></summary>
<br>

### 1) LE BUT ET LE CADRE DU PROJET

L’objectif primaire de ce projet est d’analyser les tendances macroéconomiques, d’exécuter des comparaisons entre les pays, et de trouver des corrélations entre différentes variables qui sont présentées en dessous:

***Les variables centrales:*** La croissance du PIB(Produit Intérieur Brut), l’inflation, le chômage, le chômage des jeunes, le taux d’intérêt réel, et le compte courant.

Ces apports ont été obtenus de la Banque Mondiale. 22 pays, contenant les pays de G-20, la Grèce, et la Suisse ont été représentés. Les critères stratégiques de sélection à
l’arrière du fait d’évaluer ce groupe spécifique de pays sont structurées en dessous :

***Les Critères de Sélection de 22 Pays:***

-	Les pays de G-20 dominent l’économie globale. En plus, la Suisse est intégrée comme le précurseur financier. Pour cette raison, leur existence dans l’ensemble de données assure que les déductions analytiques reflètent les tendances globales systémiques. 
-	La présence des pays développés autant que des pays en développement garantit une analyse balancée.
-	La Grèce et l’Espagne reflètent les dynamiques macroéconomiques dans les zones économiques européennes et méditerranéennes.
-	Les pays qui se constituent les sujets de la recherche offrent tous des séries de données fiables, compréhensives, et long-termes qui résultent d’une investigation approfondie.

***L’Intervalle de Temps du Projet***

Cette analyse est basée sur un intervalle de 15 années, commençant de 2010, continuant jusqu’ à 2024. Les détails indispensables qui entraînent cette décision se trouvent en dessous : 

-	2010 a été déterminé comme l’année de début afin que les effets de la crise financière mondiale de 2008 soient observable.
-	Les années de la pandémie ont aussi été incorporées dans l’analyse, avec le but d’identifier les enjeux économiques provenant d’une période si violente et volatile.
-	2024 a été désigné comme la fin de l’intervalle à cause du fait que les informations de la plupart des pays à propos de l’année 2025 sont encore absentes, comme elles ne sont pas encore finalisées.

### 2) TECHNOLOGIES / INFRASTRUCTURE

Plusieurs outils et technologies ont été mobilisés pour mener à bien ce projet Ces programmes sont les suivants:

- **Langage R:** Extraction de Données via API / Nettoyage de Données
- **Docker / DBeaver:** Hébergement de Base de Données (Microsoft SQL Server) / Gestion de Données
- **SQL:** Analyse des Données / Corrélations / Comparaisons
- **Tableau:** Visualisation des Données

### 3) R

***Les Paquets Installés***

WDI: Extraction des données

tidyverse: Nettoyage des données / Standardisation

***Extraction des Données***

Les données ont été extraites systématiquement en utilisant API de la Banque Mondiale via le paquet “WDI” en RStudio, garantissant un pipeline de données automatisé.

***Nettoyage des Données***

Cette phase comprend la manipulation des NA’s et la standardisation qui ont été exécutées grâce au paquet « tidyverse ».

***Traitement des Valeurs Manquantes***

L’ensemble de données contenait des valeurs nulles contre lesquelles prendre des mesures a nécessité un aperçu général de ce que représentent les données, exactement. Convenablement, chaque procédure de traitement des valeurs manquantes a été considérée. Afin de préserver l’intégrité de données, et en raison de la nature imprédictible des données macroéconomiques, l’imputation prédictive n’a pas été appliquée. Au lieu de cette démarche, les méthodes d’investigation ont été utilisées pour les valeurs manquantes de certains pays, puisque le coût d’opportunité d’examiner chaque valeur nulle serait plus élevé que d’exécuter l’imputation seulement sur les variables des pays clé. Dans cette optique, les valeurs vides de la Grèce, de l’Espagne, de la France, de l’Allemagne, de la Turquie, et des États-Unis ont été rigoureusement replacées par les données exactes:

**Les Pays Européens (Grèce / Espagne / France / Allemagne):**

La Grèce, l’Espagne, la France, et l’Allemagne manquaient les données sur le taux d’intérêt réel en raison d’une discordance entre la politique monétaire commune de la zone euro et les standards de taux de prêt de FMI. Afin de résoudre cet enjeu, les données brutes des pays européens sur le taux d’intérêt nominal immédiat ont été obtenues auprès de FRED (Banque Fédérale de Réserve de Saint-Louis). Elles ont aussi été ajustées en y soustrayant le taux d’inflation pour obtenir le taux d’intérêt réel.

**La Turquie:**

Les données sur le taux d’ intérêt réel de la Turquie étaient manquantes en raison des politiques divergentes et des incohérences de rapports. La Banque Centrale de la République Turque et l’Institut Statistique de la Turquie ne maintiennent pas toujours une circulation des données ininterrompue ajustée aux modèles spécifiques d’indice de la Banque Mondiale. Additionnellement, depuis 2018, la Turquie mène une politique de taux d’intérêt réel négatif résultant des valeurs extrêmes qui sont occasionnellement exclues des chaînes internationales afin de préserver la cohérence globale des données. Afin d’obtenir ces données indispensables, les taux hebdomadaires des pensions de la Banque Centrale de la République Turque ont été utilisés pour calculer les taux d’intérêt nominaux. Les versions ajustées de ces valeurs avec l’inflation ont été intégrées à l’ensemble des données.

**Les États-Unis:**

Les données des États-Unis sur le taux d’intérêt réel étaient manquantes dans l’ensemble initial de données. Afin de surmonter cet enjeu, le graphique annuel du taux d’intérêt réel a été extrait de FRED. Il y existait une discordance entre les données affichées sur le graphique et les données de la Banque Mondiale. Néanmoins, un parallélisme clair se trouvait dans l’ampleur des hausses et des baisses en glissement annuel entre les deux sources. C’était la raison pour laquelle la méthode de projection delta a été utilisée pour que les données manquantes des années 2022, 2023, et 2024 aient été calculées à partir du graphique de FRED. 

***Standardisation***

Afin d’atteindre la standardisation, de maintenir la consistance, et d’améliorer la lisibilité ; tous les nombres décimaux ont été arrondis à deux décimales. Ultérieurement, la version nettoyée et standardisée de l’ensemble initial de données a été exportée sous forme de CSV pour être ensuite analysée via SQL.


### 4) SQL

*Une analyse détaillée est en train de se construire.*

### 5) TABLEAU

***1) Les Analyses de la Croissance du PIB***

**[Cliquez pour voir le dashboard "Les Analyses de la Croissance du PIB"](https://public.tableau.com/views/GdpGrowthAnalyses/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

**Explication du Tableau de Bord:**

Ce tableau de bord incorpore 5 graphiques, dont 3 profitent de la technique de sheet swapping pour une expérience dynamique d’utilisateur. 

**Le Partage de la Croissance du PIB par pays sur le PIB Total à travers des Années (Coin Supérieur à Gauche):**

Ce diagramme circulaire a été construit pour identifier les pays qui croissent plus rapidement dans le monde en prenant en compte la contribution de chaque pays à la croissance globale.

**La Croissance Moyenne du PIB par Pays (Coin Inférieur à Gauche):**

Ce graphique en barres permet de situer les pays ayant une croissance supérieure ou inférieure par rapport à la ligne de référence de la croissance globale moyenne.

*La technique de sheet swapping encadre 3 visualisations sous le titre de « Graphiques de Corrélation » puisqu’elles révèlent les relations entre des agents différents.*

**Compte Courant vs Croissance du PIB:**

Ce graphique linéaire a été construit afin de représenter comment la croissance du PIB et le compte courant varient simultanément. Les filtres pour l’année et pour le pays permettent une analyse plus étendue. Spécifiquement, en filtrant les années à 2019-2021, les dynamiques de l’ère pandémique pourraient se représenter par rapport à l’amélioration du compte courant malgré les contractions du PIB, puisque les importations ont diminué plus que les exportations pendant cette période spécifique.

**Croissance du PIB vs Taux d’Intérêt Réel:**

Ce diagramme de dispersion vise à identifier les pays aberrants déviant de la relation prévue comme directement proportionnelle entre la croissance du PIB et le taux d’intérêt réel. 

**Croissance du PIB vs Chômage:**

Ce diagramme de dispersion met en évidence la relation inverse entre la croissance du PIB et le chômage en y intégrant une courbe de tendance. 

***2) Les Analyses Macroéconomiques***

**[Cliquez pour voir le dashboard "Les Analyses Macroéconomiques"](https://public.tableau.com/views/MacroeconomicAnalyses/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

**Explication du Tableau de Bord:**


*Le rapport d'analyse détaillé est en cours de rédaction.*

</details>
