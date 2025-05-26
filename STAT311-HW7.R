# STAT311 - Homework 7
# Name: 

# # # # # # # DO NOT EDIT BELOW # # # # # # #
tensileData=read.csv("tensileData.csv")
# # # # # # # DO NOT EDIT ABOVE # # # # # # #

# Question 1
# You are working as a data analyst for a private firm, 
#  and receive an email from your supervisor. 
# "Dear Employee" (You'd think he'd known your name by now)
# "I sent you over some data from experiments on the tensile strength of 
#  different steel samples. I need you to determine if there is evidence 
#  that the treated steel has a tensile strength higher than mu=377.9095. 
#  Test it at the usual alpha=5% level."
# (Note: Your test should look for the difference between mu_treatment-377.9095.)
#  This data is saved as "tensileData"
mu=377.9095

# Question 1.a
# What is the difference between the observed and expected mean under 
# the assumed hypothesis? 
# Save your answer in the variable q1.a
q1.a <- mean(tensileData$treated) - mu

# Question 1.b
# What is the estimated standard error of this test? 
# Save your answer in the variable q1.b
n_treated <- length(tensileData$treated)
q1.b <- sd(tensileData$treated) / sqrt(n_treated)

# Question 1.c 
# What is the test statistic T for this test? 
# Save your answer in the variable q1.c
q1.c <- q1.a / q1.b

# Question 1.d
# What is the degrees of freedom for this test? 
# Save your answer in the variable q1.d
q1.d <- n_treated - 1

# Question 1.e
# Calculate a 90% CI for the average tensile strength
#  of the treated steel and save it in a 
#  vector in the format c(lower bound, upper bound)
# Save your answer in the variable q1.e
t_critical_90 <- qt(0.95, df = q1.d)  # 90% CI uses 0.95 for one-tail
margin_90 <- t_critical_90 * q1.b
q1.e <- c(mean(tensileData$treated) - margin_90, mean(tensileData$treated) + margin_90)

# # Question 1.f
# What is the p-value for this test? 
#Save your answer in the variable q1.f
q1.f <- pt(q1.c, df = q1.d, lower.tail = FALSE)  # One-tailed test (greater than)

# Question 1.g
# TRUE or FALSE? Based on this p-value we should reject the null and 
# conclude that the treated steel has a higher mean than specified. 
# Save your answer in the variable q1.g
q1.g <- q1.f < 0.05



# Question 2
# Your supervisor responds to your email about the analysis, 
#  but your not sure that he read it. 
# "Employee"
# "Ignore my previous email, I actually needed you to compare the control 
#  and treatment groups of the data I sent you to see if the treatment 
#  group has a higher mean than the control group. The researchers tell 
#  me that they aren't sure if the treatment impacted the variability of 
#  tensile strength, so don't assume equal variances. 
#  This needs to be on my desk by end of day."
# (Note: Your test should look for the difference between mu_treatment-mu_control.)

# Question 2.a
# What is the difference between the observed difference of means and 
# the expected difference of means under the assumed hypothesis? 
# Save your answer in the variable q2.a
q2.a <- mean(tensileData$treated) - mean(tensileData$control) - 0  # Expected difference under H0 is 0

# Question 2.b
# What is the estimated standard error of this test? 
# Save your answer in the variable q2.b
n_control <- length(tensileData$control)
n_treated <- length(tensileData$treated)
se_control <- sd(tensileData$control) / sqrt(n_control)
se_treated <- sd(tensileData$treated) / sqrt(n_treated)
q2.b <- sqrt(se_treated^2 + se_control^2)

# Question 2.c
# What is the test statistic T for this test? 
# Save your answer in the variable q2.c
q2.c <- q2.a / q2.b

# Question 2.d
# What is the conservative estimation of degrees of freedom for this test? 
# Save your answer in the variable q2.d
q2.d <- min(n_treated - 1, n_control - 1)

# Question 2.e
# Calculate a 99% CI for the difference in the average tensile strength
#  of the treated steel minus the average tensile strength of the
#  untreated steel and save it in a vector in the 
#  format c(lower bound, upper bound). Use the conservative estimate of the
#  degrees of freedom in your calculation.
# Save your answer in the variable q2.e
t_critical_99 <- qt(0.995, df = q2.d)  # 99% CI uses 0.995 for two-tail
margin_99 <- t_critical_99 * q2.b
q2.e <- c(q2.a - margin_99, q2.a + margin_99)

# Question 2.f
# What is the p-value for this test using the conservative 
# estimation of the degrees of freedom? 
# Save your answer in the variable q2.f
q2.f <- pt(q2.c, df = q2.d, lower.tail = FALSE)  # One-tailed test

# Question 2.g
# What is the p-value for this test using the accurate estimation 
# of the degrees of freedom in the t.test function? 
# Save your answer in the variable q2.g
t_test_result <- t.test(tensileData$treated, tensileData$control, 
                        alternative = "greater", var.equal = FALSE)
q2.g <- t_test_result$p.value

# Question 2.h
# TRUE or FALSE? Based on this p-value we should reject the null and 
# conclude that the treated steel has a higher mean than the control steel. 
# Save your answer in the variable q2.h
q2.h <- q2.g < 0.05




# Question 3
# Your supervisor again responds to your email about the analysis, 
#  but definitely didn't read it.
# "Employee"
# "It should have been obvious," (it wasn't) "but the values in this 
#  data set are paired together, with each row representing steel samples 
#  from different manufacturers. I'm going to need you to stay late and 
#  fix the error in your analysis to account for this paired design." 
#  (Maybe you should updated your linkedin profile later)
# (Note: Your test should look for the difference between mu_treatment-mu_control.)

# Question 3.a
# What is the estimated standard error of this test? 
# Save your answer in the variable q3.a
differences <- tensileData$treated - tensileData$control
n_pairs <- length(differences)
q3.a <- sd(differences) / sqrt(n_pairs)

# Question 3.b
# What is the test statistic T for this test? 
# Save your answer in the variable q3.b
mean_diff <- mean(differences)
q3.b <- mean_diff / q3.a

# Question 3.c
# What is the degrees of freedom for this test? 
# Save your answer in the variable q3.c
q3.c <- n_pairs - 1

# Question 3.d
# What is the p-value for this test? 
# Save your answer in the variable q3.d
q3.d <- pt(q3.b, df = q3.c, lower.tail = FALSE)  # One-tailed test

# Question 3.e
# TRUE or FALSE? Based on this p-value we should reject the null and 
# conclude that the treated steel has a higher mean than the control steel. 
# Save your answer in the variable q3.e
q3.e <- q3.d < 0.05