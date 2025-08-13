---
output:
  pdf_document: default
  html_document: default
---
# (PART) Statistics {-}

# Statistics {-} 

## Scales of Measurements {-}

### Interval Scales {-}

#### Examples {-}

- Temperature (Celsius scale)
- Dates (AD)
- Location in Cartesian coordinates
- Direction measured in degrees

#### Why Locations in Cartesian coordinates are **interval data** {-}

Locations in Cartesian coordinates are **interval data** because:

In short, ***— $x=10$ is not “twice as far to the right” as $x=5$***

**Detailed**

1. **Equal intervals have equal meaning**

   * In the Cartesian system, the difference between two $x$-coordinates (or two $y$-coordinates) represents the same physical distance, regardless of where it is measured.
   * For example, moving from $x = 2$ to $x = 5$ is a change of $3$ units, which is the same "amount of movement" as going from $x = 20$ to $x = 23$.

2. **Arbitrary origin**

   * The $(0,0)$ origin is chosen for convenience, not because it represents an absolute “zero” location.
   * A point at $x = 0$ does not mean “no position” — it’s just the reference point we picked.
   * Because the zero is arbitrary, coordinates behave like interval data, not ratio data.

3. **Meaningful differences, not meaningful ratios**

   * You can meaningfully talk about differences ($\Delta x$ or $\Delta y$) to measure displacement.
   * But a ratio like “this point’s $x$-coordinate is twice that of another” is meaningless — $x=10$ is not “twice as far to the right” as $x=5$ in an absolute sense, because the zero point is arbitrary.

So, **Cartesian coordinates** → **interval scale**
**Distances between points** (via Euclidean distance) → **ratio scale** (because distance has a true zero).


#### Why Date is an **interval scale** {-}

In short, ***A person born in 1940 doesn't always have double age of a person born in 1950. It's so only in 1960.***

**Detailed**

Date is an **interval scale** because it has a meaningful order and equal intervals between measurements, but it lacks a true zero point.

* **Order:** Dates can be placed in a specific order (e.g., January 1, 2024, comes before January 2, 2024).
* **Equal Intervals:** The duration between any two dates is consistent and measurable. The interval between May 1st and May 10th is exactly 9 days, just as the interval between November 1st and November 10th is 9 days. This allows for meaningful subtraction (e.g., "how many days have passed?").
* **No True Zero:** The starting point of a calendar system (e.g., the year 0 in the Gregorian calendar) is an arbitrary convention, not an absolute absence of time. You can't say that a year in the 2nd century A.D. is "twice as old" as a year in the 1st century A.D. in a meaningful ratio sense, because the scale doesn't start from a true zero.
* **Meaningful Subtraction, Not Division:** You can meaningfully subtract dates. For example, a person born in 1940 is 10 years older than a person born in 1950 in any given year ($1950 - 1940 = 10$). However, you cannot meaningfully divide them. The statement "1940 is double 1950" is only true in an arbitrary mathematical sense on a single date, not as a fundamental property of the ages.

