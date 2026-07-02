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



**the USA:**


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

L’ensemble de données contenait des valeurs nulles contre lesquelles prendre des mesures a nécessité un aperçu général de ce que représentent les données, exactement. Convenablement, chaque procédure de traitement des valeurs manquantes a été considérée. Afin de préserver l’intégrité de données, et en raison de la nature imprédictible des données macroéconomiques, l’imputation prédictive n’a pas été appliquée. Au lieu de cette démarche, les méthodes d’investigation ont été utilisées pour les valeurs manquantes de certains pays, puisque le coût d’opportunité d’examiner chaque valeur nulle serait plus élevé que d’exécuter l’imputation seulement sur les variables des pays clé. Dans cette optique, les valeurs vides de la Grèce, de l’Espagne, de la France, de l’Allemagne, de la Turquie, et des Etats-Unis ont été rigoureusement replacées par les données exactes:

**Les Pays Européens (Grèce / Espagne / France / Allemagne):**

La Grèce, l’Espagne, la France, et l’Allemagne manquaient les données sur le taux d’intérêt réel en raison d’une discordance entre la politique monétaire commune de la zone euro et les standards de taux de prêt de FMI. Afin de résoudre cet enjeu, les données brutes des pays européens sur le taux d’intérêt nominal immédiat ont été obtenues auprès de FRED (Banque Fédérale de Réserve de Saint-Louis). Elles ont aussi été ajustées en y soustrayant le taux d’inflation pour obtenir le taux d’intérêt réel.

**La Turquie:**


**Les Etats-Unis:**

*Le rapport d'analyse détaillé est en cours de rédaction.*

</details>
