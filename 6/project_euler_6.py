lower = 1
upper = 100

# Power Summation of squares
sum1 = (upper * (upper+1) * ((2 * upper) + 1)) / 6
# Summation to the power of 2
sum2 = pow((((lower + upper) * (upper + lower - 1)) / 2), 2)

print sum2 - sum1
