# Import
```python
import numpy as np
```
# Numpy - Making arrays and matrices 
## From non numpy array
```python
mylist = [1, 2, 3, 4, 5]
my_np_arr = np.array(mylist) # make numpy array from ordinary array

my_matrix = [[1,2,3], [4,5,6], [7,8,9]]
my_np_matrix = np.array(my_matrix)  # converting list to numpy matrix
```
## np from range
```python
# creating numpy array from range.
np.arange(101) # 0 1 ... 100
np.arange(40, 101) # 40 41 ... 100
np.arange(0, 101, 20) # 0 20 ... 100
np.array([1, 2, 3, 4], ndmin=5) # 5 dimensions [[[[[1 2 3 4]]]]]

np.arange(-3, 3, 0.5, dtype=int) # [-3 -2 -1  0  1  2  3  4  5  6  7  8]
np.arange(-3, 3, 0.5) # [-3.  -2.5 -2.  -1.5 -1.  -0.5  0.   0.5  1.   1.5  2.   2.5]

# evenly spaces values
np.linspace(0, 98, 4) # from 0 to 98 four values that has the same spaces in between [ 0.         32.66666667 65.33333333 98.        ]
np.linspace(1,5,11) # [1.  1.4 1.8 2.2 2.6 3.  3.4 3.8 4.2 4.6 5. ]
```
## np from filling with 1s and 0s
```python
np.zeros(5) # only zeros [0. 0. 0. 0. 0.]
np.zeros((5,3)) # zeros with dimension 5x3
# [[0. 0. 0.]
#  [0. 0. 0.]
#  [0. 0. 0.]
#  [0. 0. 0.]
#  [0. 0. 0.]]
np.ones((1,1)) # only 1s [[1.]]

# Those are normally floating zeros and ones, for integer 1s and 0s
np.zeros(4, dtype=int) # [0 0 0 0]

# identity matrix
np.eye(4, dtype=int)
# [[1 0 0 0]
#  [0 1 0 0]
#  [0 0 1 0]
#  [0 0 0 1]]
```
## np from random
```python
# Fill Random values in range of 0-1
np.random.rand(3) # [0.9080363 0.6204167 0.7617961]
np.random.rand(2,3) # matrix
# [[0.37384148 0.84334678 0.30948109]
#  [0.80662543 0.07976939 0.18871534]]

np.random.randn(5) # standard normal distribution. Here mean is 0, and the standard deviation is 1
# [ 0.78180116 -0.36434123 -0.08834132  1.31039729 -0.76613834]
np.random.randn(5,3) # matrix

np.random.randint(20,30) # random integer from 20 to 30 -> 26
np.random.randint(20,30,3) # random 3 integers from 20 to 30 -> [25 22 20]
np.random.randint(20,30,(2,2)) # random 2x2 integers from 20 to 30 
# [[28 25]
#  [21 24]]

# after each time running the random generators, integers change, because seed also changes. 
# But you can set seed manually to not change and every time random will return the same random integers
np.random.seed(44) # then write anything from above, and the random output will remain the same. For example, each time the output will be 26. Here 44 can be any other number.

```
# Operations on Numpy arrays
## np Array's atributes
```python
# dimensions
array1 = np.ones(10)
array2 = np.ones((2,3,4))
print(array1.ndim) # 1
print(array2.ndim) # 3

# data type of arrays
array3 = np.zeros(4, dtype=int)
print(array3.dtype) # int64
print(array1.dtype) # float64

# shape of array
print(array1.shape) # (10,) means 10x1
print(array2.shape) # (2, 3, 4) means 2x3x4

# max and min, and index of max in min
array4 = np.arange(40, 101)
print(array4.max()) # 100
print(array4.argmax()) # 60 is index of 100
print(array4.min()) # 40
print(array4.argmin()) # 0 is index of 40
```
## Reshaping
```python
arr = np.arange(0, 100, 5) # [ 0  5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95]
print(arr)
print(arr.reshape(4, 5))
# [[ 0  5 10 15 20]
#  [25 30 35 40 45]
#  [50 55 60 65 70]
#  [75 80 85 90 95]]
```
## Some operations
```python
array1 = np.arange(0, 10, 2) # [0 2 4 6 8]
array2 = np.arange(1, 11, 2) # [1 3 5 7 9]

# concatenation 
array = np.concatenate((array1, array2), axis = 0) # [0 2 4 6 8 1 3 5 7 9]

# dot product
array = np.dot(array1, array2) # 140

# change data type of array
arr = np.array([10.5, 20.1, 30.4, 40.6, 50.3])
int_arr = arr.astype('int32') # [10 20 30 40 50]
```
# Numpy - Select
Selecting 
```python
import numpy
x = numpy.arange(20) # some numbers
condlist = [x<5,x>10] # condition 1 and 2
choicelist = [x,x*2] # if condition 1 then x, if cond 2 then x*2
print(numpy.select(condlist,choicelist,1000)) # if none of conditions met for some number then 1000
```





# Others non Numpy related but mentioned in lesson
### zip
```python
a = [1,2,3]
b = ["a", "b", "c"]
c = zip(a,b) # dot product
for i in c:
    print(i, end=" ")
# (1, 'a') (2, 'b') (3, 'c')
```