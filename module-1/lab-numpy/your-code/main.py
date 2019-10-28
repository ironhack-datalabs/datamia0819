#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.


numpy.version.version
#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a=np.random.random((2,3,5))


#4. Print a.
print(a)


#5. Create a 5x3x2 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
b=np.full((5,3,2),1)


#6. Print b.

print(b)

#7. Do a and b have the same size? How do you prove that in Python code?


if a.size==b.size:
    print('a and b are same size')

#8. Are you able to add a and b? Why or why not?

# No The shapes of a and b are different
# ValueError: operands could not be broadcast together with shapes (2,3,5) (5,3,2) 


#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

c=np.transpose(b)

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d=np.add(a,c)
#transposing made is the same shape

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print(a)
print(d)


#12. Multiply a and c. Assign the result to e.

e=np.multiply(a,c)


#13. Does e equal to a? Why or why not?

np.array_equal(a,e)
# True
# They are equal because a is multiplied by an array with values 1



#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"


d_max=np.amax(d)
d_min=np.amin(d)
d_mean=np.mean(d)

#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.

f=np.empty((2,3,5))


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
for a in range(len(d)):
   for i in range(len(d[a])):
       for j in range(len(d[a][i])):
           if d[a][i][j] > d_min and d[a][i][j] < d_mean:
               f[a][i][j]= 25
           elif d[a][i][j] > d_mean and d[a][i][j] < d_max:
               f[a][i][j]= 75
           elif d[a][i][j] == d_mean:
               f[a][i][j] = 50
           elif d[a][i][j] == d_min:
               f[a][i][j] = 0
           elif d[a][i][j] == d_max:
               f[a][i][j] = 100
                
#17. Print d and f. Do you have your expected f?
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""
d=array([[[1.82608335, 1.66654861, 1.79395313, 1.29290307, 1.55588339],
        [1.99064011, 1.53267813, 1.88520454, 1.84589052, 1.95950525],
        [1.58826284, 1.80651052, 1.1238721 , 1.26921554, 1.6379911 ]],

       [[1.25061415, 1.4982913 , 1.655471  , 1.88135663, 1.63359036],
        [1.27349667, 1.85363145, 1.51340545, 1.55591956, 1.57006515],
        [1.84919102, 1.43806659, 1.44029593, 1.46790096, 1.46140607]]])
        
f=array([[[ 75.,  75.,  75.,  25.,  25.],
        [100.,  25.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  25.,  75.]],

       [[ 25.,  25.,  75.,  75.,  75.],
        [ 25.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  25.,  25.,  25.]]])

"""
#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""

v=np.full((2,3,5),'')
for a in range(len(d)):
     for i in range(len(d[a])):
       for j in range(len(d[a][i])):
           if d[a][i][j] > d_min and d[a][i][j] < d_mean:
               v[a][i][j]= 'A'
           elif d[a][i][j] > d_mean and d[a][i][j] < d_max:
               v[a][i][j]= 'B'
           elif d[a][i][j] == d_mean:
               v[a][i][j] = 'C'
           elif d[a][i][j] == d_min:
               v[a][i][j] = 'D'
           elif d[a][i][j] == d_max:
               v[a][i][j] = 'E'
 


