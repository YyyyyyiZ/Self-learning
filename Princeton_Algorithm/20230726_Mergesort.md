# MERGESORT

> non-trivial algorithm

* Java sort for objects
* Perl, C++ stable sort, Python stable sort, Firefox JavaScript

## mergesort

* Divide array into 2 halves
* Recursively sort each half
* Merge 2 halves

```java
public class Merge {

    private Merge() { }

    // stably merge a[lo .. mid] with a[mid+1 ..hi] using aux[lo .. hi]
    private static void merge(Comparable[] a, Comparable[] aux, int lo, int mid, int hi) {
        // precondition: a[lo .. mid] and a[mid+1 .. hi] are sorted subarrays
        assert isSorted(a, lo, mid);
        assert isSorted(a, mid+1, hi);

        // copy to aux[]
        for (int k = lo; k <= hi; k++) {
            aux[k] = a[k];
        }

        // merge back to a[]
        int i = lo, j = mid+1;
        for (int k = lo; k <= hi; k++) {
            if      (i > mid)              a[k] = aux[j++];
            else if (j > hi)               a[k] = aux[i++];
            else if (less(aux[j], aux[i])) a[k] = aux[j++];
            else                           a[k] = aux[i++];
        }

        // postcondition: a[lo .. hi] is sorted
        assert isSorted(a, lo, hi);
    }

    // mergesort a[lo..hi] using auxiliary array aux[lo..hi]
    private static void sort(Comparable[] a, Comparable[] aux, int lo, int hi) {
        if (hi <= lo) return;
        int mid = lo + (hi - lo) / 2;
        sort(a, aux, lo, mid);
        sort(a, aux, mid + 1, hi);
        merge(a, aux, lo, mid, hi);
    }

    public static void sort(Comparable[] a) {
        Comparable[] aux = new Comparable[a.length];
        sort(a, aux, 0, a.length-1);
        assert isSorted(a);
    }

    private static boolean less(Comparable v, Comparable w) {
        return v.compareTo(w) < 0;
    }

    private static boolean isSorted(Comparable[] a) {
        return isSorted(a, 0, a.length - 1);
    }

    private static boolean isSorted(Comparable[] a, int lo, int hi) {
        for (int i = lo + 1; i <= hi; i++)
            if (less(a[i], a[i-1])) return false;
        return true;
    }

    private static void merge(Comparable[] a, int[] index, int[] aux, int lo, int mid, int hi) {

        // copy to aux[]
        for (int k = lo; k <= hi; k++) {
            aux[k] = index[k];
        }

        // merge back to a[]
        int i = lo, j = mid+1;
        for (int k = lo; k <= hi; k++) {
            if      (i > mid)                    index[k] = aux[j++];
            else if (j > hi)                     index[k] = aux[i++];
            else if (less(a[aux[j]], a[aux[i]])) index[k] = aux[j++];
            else                                 index[k] = aux[i++];
        }
    }

    public static int[] indexSort(Comparable[] a) {
        int n = a.length;
        int[] index = new int[n];
        for (int i = 0; i < n; i++)
            index[i] = i;

        int[] aux = new int[n];
        sort(a, index, aux, 0, n-1);
        return index;
    }

    // mergesort a[lo..hi] using auxiliary array aux[lo..hi]
    private static void sort(Comparable[] a, int[] index, int[] aux, int lo, int hi) {
        if (hi <= lo) return;
        int mid = lo + (hi - lo) / 2;
        sort(a, index, aux, lo, mid);
        sort(a, index, aux, mid + 1, hi);
        merge(a, index, aux, lo, mid, hi);
    }

    // print array to standard output
    private static void show(Comparable[] a) {
        for (int i = 0; i < a.length; i++) {
            StdOut.println(a[i]);
        }
    }

    public static void main(String[] args) {
        String[] a = StdIn.readAllStrings();
        Merge.sort(a);
        show(a);
    }
}
```

## assert

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726111555151.png" alt="image-20230726111555151" style="zoom:50%;" />

## practical improvements

### Insertion-Merge Sort

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726113700724.png" alt="image-20230726113700724" style="zoom:50%;" />

### Stop if already sorted

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726113727147.png" alt="image-20230726113727147" style="zoom:45%;" />

### Eliminate the copy to the auxiliary array

* Eliminate the time (but not the space) taken to copy to the auxiliary array used for merging. 
* use two invocations of the sort method, one that takes its input from the given array and puts the sorted output in the auxiliary array; the other takes its input from the auxiliary array and puts the sorted output in the given array. 
* Can arrange the recursive calls such that the computation switches the roles of the input array and the auxiliary array at each level.

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726113802462.png" alt="image-20230726113802462" style="zoom: 45%;" />

## bottom-up mergesort

* Pass through array, merging subarrays of size 1
* Repeat for subarrays of size 2, 4, 8, 16,…
* use extra space

```java
    public static void sort(Comparable[] a) {
        int n = a.length;
        Comparable[] aux = new Comparable[n];
        for (int len = 1; len < n; len *= 2) {
            for (int lo = 0; lo < n-len; lo += len+len) {
                int mid  = lo+len-1;
                int hi = Math.min(lo+len+len-1, n-1);
                merge(a, aux, lo, mid, hi);
            }
        }
        assert isSorted(a);
    }
```

## sorting complexity

### Terminology

* Computational complexity—Framework to study efficiency of algorithms for solving a particular problem X
* Model of computation—Allowable operations
* Cost model—Operation count(s)
* Upper bound—Cost guarantee provided by some algorithm for X
* Lower bound—Proven limit on cost guarantee  of all algorithms for X
* Optimal Algorithm—Algorithm with best possible cost guarantee for X
	* lower bound $\sim$ upper bound

### Example

* Model of computation: decision tree
* Cost model: #compares
* Upper bound: $\sim NlogN$ from mergesort
* Lower bound: $\sim NlogN$
* Optimal algorithm: mergesort
* ==mergesort is not optimal with respect to space usage==

### Compare-based lower bound for sorting

* Any compared-based sorting algorithm must use at least $log(N!)\sim NlogN$ compares in the worst case

### Complexity results in context

> Lower bound may not hold if the algorithm has information about:

* The initial order of the input
* The distribution of key values
* The representation of the keys

## comparators

## stability

> A stable sort preserves the relative order of items with equal keys

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726122241488.png" alt="image-20230726122241488" style="zoom: 25%;" />

* Insertion sort
	* stable, equal items never pass one another
* mergesort
	* stable, merge operation is stable, if two values are equal, first take from the left subarray
* selection sort
	* unstable, long-distance exchange might move an item past some equal item
* shellsort
	* unstable, long-distance exchange