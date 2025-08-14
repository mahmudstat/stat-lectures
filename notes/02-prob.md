---
output:
  pdf_document: default
  html_document: default
---

# (PART) Probability {-}

# Random variable

## List of probability distributions

## Discrete distributions

Probability Mass Functions (PMF)

1. $P(x) = \frac{1}{14} (a+2x); x = -3, -2, -1, 0, 1, 2, 3$
1. $P(x) = k(x-2); x = 3, 4,5,6,7,8$
1. $P(x) = \frac{x-1}{k}; x=2,3,4,5$
1. $P(x) = \frac{3-|4-x|}{k}; x=2,3,4,5,6$
1. $p(x) = \frac{x+4}{30}; x=0,1,2,3,4$
2. $P(x) = \frac{2x+k}{56}; x = -3, -2, -1, 0, 1, 2, 3$
3. $P(x) = \frac{x+1}{k}; x= 1,2,3,4$

### Continuous

Probability Density Functions (PDF)

1. $f(x) = 2x; 0 < x < 1$
1. $f(x) = \frac{1}{30} (3+2x); 2 < x < 5$
1. $f(x) = ax^2; 0 < x < 4$
1. $f(x) = kx^2 + kx + \frac 18; 0 < x < 8$
1. $f(x) = kx; 0 < x < 4$
1. $f(x) = 3x^2; 0 \le x \le 1$
1. $f(y) = k(3y+5); 1 < y < 5$
1. $f(z) = \frac29 (3z-z^2); 0 \le x \le 3$

#### Joint PDF

1. $$f(x,y) = 8xy; 0 < x, y <1$$
2. $$f(x,y) = \frac 3 2 (x+y); 0 < x, y <1$$
3. $$f(x,y) = 4x(1-y); 0 < x, y <1$$
3. $$f(x,y) = 6xy^2); 0 < x, y <1$$

# Mathematical Expectation 

## Problems

### Gain-loss

A bag has 4 green and 6 black balls. 3 balls are drawn randomly. Choosing a green ball brings 10 tk gain, while a black one takes away 5 tk. What is the expected gain?

**Solution**

| Green Balls | Black Balls |            Gain $x$ (Tk)           |       Probability $p(x)$      |
|:-----------:|:-----------:|:----------------------------------:|:-----------------------------:|
|      3      |      0      | $3 \times 10 + 0 \times (-5) = 30$ | $\frac{1}{30} \approx 0.0333$ |
|      2      |      1      |                 15                 |      $\frac{9}{30} = 0.3$     |
|      1      |      2      |                  0                 |     $\frac{15}{30} = 0.5$     |
|      0      |      3      |                 -15                | $\frac{5}{30} \approx 0.1667$ |
