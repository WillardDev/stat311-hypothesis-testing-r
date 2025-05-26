# STAT 311 Hypothesis Testing in R

This repository contains solutions to hypothesis testing assignments for STAT 311, focusing on t-tests and statistical inference using R.

## Assignment 7 Overview

This assignment demonstrates three fundamental types of t-tests through a workplace scenario involving tensile strength analysis of steel samples.

### Scenario: Steel Tensile Strength Analysis

You work as a data analyst receiving increasingly complex (and poorly communicated) requests from your supervisor about analyzing steel tensile strength data.

## Statistical Methods Covered

### Question 1: One-Sample t-Test
**Scenario**: Test if treated steel has tensile strength higher than μ = 377.9095
- **Null Hypothesis**: H₀: μ = 377.9095
- **Alternative Hypothesis**: H₁: μ > 377.9095
- **Methods Applied**:
  - Sample mean vs. hypothesized mean comparison
  - Standard error calculation
  - t-statistic computation
  - Confidence interval construction (90%)
  - p-value calculation for one-tailed test

### Question 2: Two-Sample t-Test (Unequal Variances)
**Scenario**: Compare treated vs. control groups without assuming equal variances
- **Null Hypothesis**: H₀: μ_treated - μ_control = 0
- **Alternative Hypothesis**: H₁: μ_treated - μ_control > 0
- **Methods Applied**:
  - Welch's t-test (unequal variances)
  - Conservative degrees of freedom estimation
  - Pooled standard error calculation
  - Confidence interval construction (99%)
  - Comparison of conservative vs. accurate p-values

### Question 3: Paired t-Test
**Scenario**: Account for paired design where each row represents samples from the same manufacturer
- **Null Hypothesis**: H₀: μ_difference = 0
- **Alternative Hypothesis**: H₁: μ_difference > 0
- **Methods Applied**:
  - Difference calculation for paired observations
  - Standard error of differences
  - Paired t-statistic computation
  - One-tailed p-value for paired design

## Key Statistical Concepts

### Hypothesis Testing Framework
- Type I error control (α = 0.05)
- One-tailed vs. two-tailed tests
- p-value interpretation and decision making
- Statistical significance assessment

### t-Distribution Applications
- Degrees of freedom calculations for different test types
- Critical value determination for confidence intervals
- Conservative vs. exact degree of freedom estimates

### Study Design Recognition
- Independent samples vs. paired samples
- Impact of study design on statistical analysis
- Variance assumptions and their violations

## R Programming Techniques

### Data Manipulation
- CSV file reading and data extraction
- Column-wise operations on data frames
- Difference calculations for paired data

### Statistical Functions
- `mean()`, `sd()`, `length()` for descriptive statistics
- `qt()` for t-distribution critical values
- `pt()` for p-value calculations
- `t.test()` for built-in hypothesis testing

### Confidence Intervals
- Manual CI construction using critical values
- Margin of error calculations
- Vector creation for interval bounds

## Files

- `STAT311-HW7.R` - Complete solution with all three question sets
- `tensileData.csv` - Steel tensile strength data (74 paired observations)

## Results Summary

The analysis demonstrates how different statistical approaches can lead to different conclusions:
- **One-sample test**: Strong evidence that treated steel exceeds the specified value
- **Two-sample test**: Moderate evidence of treatment effect
- **Paired test**: Strongest evidence due to reduced variability from pairing

## Educational Value

This assignment illustrates:
- The importance of understanding study design before analysis
- How pairing can increase statistical power
- The impact of variance assumptions on hypothesis tests
- Real-world application of multiple t-test variants

---

*Course: STAT 311 - Probability and Statistics*  
*Assignment: Programming Assignment 7 - Hypothesis Testing*  
*Focus: t-Tests, Confidence Intervals, Statistical Inference*
