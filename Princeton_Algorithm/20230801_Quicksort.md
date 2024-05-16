# QUICKSORT

## quicksot

> The most important algo in the 20th century

### Usage

* Java sort for primitive types
* C qsort, Unix, Visual C++, Python, Matlab, Chrome JavaScript

### Basic Plan

* **Shuffle** the array
* **Partition** so that for some j
	* entry a[j] is in place
	* no larger entry to the left of j
	* no smaller entry to the right of j
* **Sort** each piece recursively

### Details

* Patitioning in-place

	Using and extra array makes partitioning easier and stable, but is not worth the cost

* Terminating the loop

	Testing whether the pointers cross is a bit trickier than it might seem

* Staying in bounds

	The (j == lo) test is redundant [will stop when hits the partition element], but the (i == hi) test is not

* ==Preserving randomness==

	Shuffling is needed for performance guarantee

* Equal keys

	When duplicates are present, it is (counter-intuitively) better to stop on keys equal to the partitioning item’s key

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801172438863.png" alt="image-20230801172438863" style="zoom:50%;" />

### Implementation

> quadratic time for many duplicates arrays

```java
public class Quick {

    // This class should not be instantiated.
    private Quick() { }

    public static void sort(Comparable[] a) {
        StdRandom.shuffle(a);
        sort(a, 0, a.length - 1);
        assert isSorted(a);
    }

    // quicksort the subarray from a[lo] to a[hi]
    private static void sort(Comparable[] a, int lo, int hi) {
        if (hi <= lo) return;
        int j = partition(a, lo, hi);
        sort(a, lo, j-1);
        sort(a, j+1, hi);
        assert isSorted(a, lo, hi);
    }

    // partition the subarray a[lo..hi] so that a[lo..j-1] <= a[j] <= a[j+1..hi]
    // and return the index j.
    private static int partition(Comparable[] a, int lo, int hi) {
        int i = lo;
        int j = hi + 1;
        Comparable v = a[lo];
        while (true) {

            // find item on lo to swap
            while (less(a[++i], v)) {
                if (i == hi) break;
            }

            // find item on hi to swap
            while (less(v, a[--j])) {
                if (j == lo) break;      // redundant since a[lo] acts as sentinel
            }

            // check if pointers cross
            if (i >= j) break;

            exch(a, i, j);
        }

        // put partitioning item v at a[j]
        exch(a, lo, j);

        // now, a[lo .. j-1] <= a[j] <= a[j+1 .. hi]
        return j;
    }

    public static Comparable select(Comparable[] a, int k) {
        if (k < 0 || k >= a.length) {
            throw new IllegalArgumentException("index is not between 0 and " + a.length + ": " + k);
        }
        StdRandom.shuffle(a);
        int lo = 0, hi = a.length - 1;
        while (hi > lo) {
            int i = partition(a, lo, hi);
            if      (i > k) hi = i - 1;
            else if (i < k) lo = i + 1;
            else return a[i];
        }
        return a[lo];
    }

    private static boolean less(Comparable v, Comparable w) {
        if (v == w) return false;   // optimization when reference equals
        return v.compareTo(w) < 0;
    }

    // exchange a[i] and a[j]
    private static void exch(Object[] a, int i, int j) {
        Object swap = a[i];
        a[i] = a[j];
        a[j] = swap;
    }

    private static boolean isSorted(Comparable[] a) {
        return isSorted(a, 0, a.length - 1);
    }

    private static boolean isSorted(Comparable[] a, int lo, int hi) {
        for (int i = lo + 1; i <= hi; i++)
            if (less(a[i], a[i-1])) return false;
        return true;
    }


    // print array to standard output
    private static void show(Comparable[] a) {
        for (int i = 0; i < a.length; i++) {
            StdOut.println(a[i]);
        }
    }

    public static void main(String[] args) {
        String[] a = StdIn.readAllStrings();
        Quick.sort(a);
        show(a);
        assert isSorted(a);

        // shuffle
        StdRandom.shuffle(a);

        // display results again using select
        StdOut.println();
        for (int i = 0; i < a.length; i++) {
            String ith = (String) Quick.select(a, i);
            StdOut.println(ith);
        }
    }

}
```

### Improvements

* Insertion sort small subarrays for ~ 10 items
* Partition element to be the median of sample
	* best choice of pivot item = median
	* estimate true median by taking median of samples
	* median-of-3 items

## selection

* Goal. Given an array of $N$ items, find the $k^{th}$ largest
* Ex. min$(k=0)$, max$(k=N-1)$, median$(k=N/2)$
* Applications
	* order statistics
	* find top $k$

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801173552342.png" alt="image-20230801173552342" style="zoom:50%;" />

## duplicate keys

### Dijkstra 3-way partitioning

> quicksort with 3-way patitioning is entropy-optimal

>randomized quicksort with 3-way partitioning reduces running time from linearithmic to linear in broad class of applications

```java
    // quicksort the subarray a[lo .. hi] using 3-way partitioning
    private static void sort(Comparable[] a, int lo, int hi) {
        if (hi <= lo) return;
        int lt = lo, gt = hi;
        Comparable v = a[lo];
        int i = lo + 1;
        while (i <= gt) {
            int cmp = a[i].compareTo(v);
            if      (cmp < 0) exch(a, lt++, i++);
            else if (cmp > 0) exch(a, i, gt--);
            else              i++;
        }

        // a[lo..lt-1] < v = a[lt..gt] < a[gt+1..hi].
        sort(a, lo, lt-1);
        sort(a, gt+1, hi);
        assert isSorted(a, lo, hi);
    }
```

## system sorts

### Applications

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801175641236.png" alt="image-20230801175641236" style="zoom: 50%;" />

### Java system sort

* use tuned quicksort for primitive types
* use mergesort for objects

### Tukey’s ninther

* Median of the median of 3 samples, each of 3 entries.

	* Approximate the median of 9
	* Use at most 12 compares

* Why TN?

	Better partitioning than random shuffled and less costly

### Which algo to use?

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801180616451.png" alt="image-20230801180616451" style="zoom:50%;" />

### Considerations when choosing

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801180707619.png" alt="image-20230801180707619" style="zoom:50%;" />

# Summary

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801180805188.png" alt="image-20230801180805188" style="zoom:50%;" />