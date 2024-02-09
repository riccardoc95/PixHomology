#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>
#include <math.h>
#include <time.h>


// Define a struct to store the result
typedef struct {
    float *data;
    int length;
} Result;

// Define a struct to store information about u_points
typedef struct {
    double u_val;
    double c_val;
    int c_point;
    int u_point;
} UPoint;

// Define a struct to store information about argmin and argmax
typedef struct {
    int argmin;
    int argmax;
} MinMaxIndices;


// Function to find Argmin and Argmax of array
MinMaxIndices findArgminArgmax(const double *arr, int size) {
    MinMaxIndices result;

    if (size == 0) {
        // Handle the case when the array is empty
        result.argmin = -1;  // Convention for indicating no minimum
        result.argmax = -1;  // Convention for indicating no maximum
        return result;
    }

    double min_val = arr[0];
    double max_val = arr[0];
    int min_index = 0;
    int max_index = 0;

    for (int i = 1; i < size; i++) {
        if (arr[i] < min_val) {
            min_val = arr[i];
            min_index = i;
        }

        if (arr[i] > max_val) {
            max_val = arr[i];
            max_index = i;
        }
    }

    result.argmin = min_index;
    result.argmax = max_index;

    return result;
}

// Function to compare UPoints for qsort
int compareUPoints(const void *a, const void *b) {    
    UPoint *p1 = (UPoint *) a;
    UPoint *p2 = (UPoint *) b;
    if (p2->u_val > p1->u_val){
        return 1;
    }else if (p2->u_val < p1->u_val){
        return -1;
    }else{
        if (p2->c_val > p1->c_val){
            return 1;
        }else if (p2->c_val < p1->c_val){
            return -1;
        }else{
            if (p2->c_point > p1->c_point){
                return 1;
            }else if (p2->c_point < p1->c_point){
                return -1;
            }else{
                if (p2->u_point > p1->u_point){
                    return 1;
                }else if (p2->u_point < p1->u_point){
                    return -1;
                }else{
                    return 0;
                }
            }
        }
    }
}


// Persistent Homology dimension 0 function
Result calculatePH(float *inputArray, int numRows, int numCols) {
    
    // Input array for noise
    double *input = malloc(numRows * numCols * sizeof(double));;

    //Intializes random number generator
    time_t t;
    srand((unsigned) time(&t));
    
    // Add noise
    for (int i = 0; i < numRows * numCols; i++) { 
        double noise = (rand() / (RAND_MAX+1.)) / 10;
        input[i] = (double)inputArray[i] * 1000000 + noise;
    }

    // Calculate Argmin and Argmax
    MinMaxIndices argMinMax = findArgminArgmax(input, numRows * numCols);

    
    // Allocate memory for the mpatch array
    int *mpatch = malloc(numRows * numCols * sizeof(int));

    // Allocate memory for the array of UPoints
    UPoint *u_points = malloc(1 * sizeof(UPoint));
    int num_u_points = 0;

    // Set up mpatch array
    for (int i = 0; i < numRows * numCols; i++) {
        mpatch[i] = i;
    }

    
    // First pass to find local maxima
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            int x_start = (i > 0) ? (i - 1) : 0;
            int y_start = (j > 0) ? (j - 1) : 0;
            int x_end = (i < (numRows - 1)) ? (i + 1) : (numRows - 1);
            int y_end = (j < (numCols - 1)) ? (j + 1) : (numCols - 1);

            int c_point = i * numCols + j;
            double localmax = input[c_point];

            for (int h = x_start; h <= x_end; h++) {
                for (int k = y_start; k <= y_end; k++) {
                     int t_point = h * numCols + k;
                    if (localmax < input[t_point]) {
                        mpatch[c_point] = t_point;
                        localmax = input[t_point];
                    }
                }
            }
        }
    }
    
    // Second pass to update the mpatch array
    while (1) {
        int changed = 0;
        for (int i = 0; i < numRows * numCols; i++) {
            if (mpatch[i] != mpatch[mpatch[i]]) {
                mpatch[i] = mpatch[mpatch[i]];
                changed = 1;
            }
        }
        if (!changed) {
            break;
        }
    }
    
    // Find u_points
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            int x_start = (i > 0) ? (i - 1) : 0;
            int y_start = (j > 0) ? (j - 1) : 0;
            int x_end = (i < (numRows - 1)) ? (i + 1) : (numRows - 1);
            int y_end = (j < (numCols - 1)) ? (j + 1) : (numCols - 1);

            int c_point = i * numCols + j;

            int u_point = c_point;
            double u_val = input[u_point];

            for (int h = x_start; h <= x_end; h++) {
                for (int k = y_start; k <= y_end; k++) {
                    int t_point = h * numCols + k;

                    int c_obj = mpatch[c_point];
                    int t_obj = mpatch[t_point];

                    double c_val = input[c_point];
                    double t_val = input[t_point];

                    //int c_obj_val = input[c_point];
                    //int t_obj_val = input[t_point];

                    if (c_point != t_point && c_obj != t_obj && c_val > t_val) {
                        u_points = realloc(u_points, (1 + num_u_points) * sizeof(UPoint));
                        
                        u_point = t_point;
                        u_val = input[u_point];

                        // Store information about u_point in the u_points array
                        u_points[num_u_points].u_val = u_val;
                        u_points[num_u_points].c_val = c_val;
                        u_points[num_u_points].c_point = c_point;
                        u_points[num_u_points].u_point = u_point;

                        num_u_points++;

                        
                        
                    }
                }
            }
        }
    }

    // Sort u_points in descending order
    qsort(u_points, num_u_points, sizeof(*u_points), compareUPoints);

    // Create an array to store information about dgm
    float *dgm = (float *)malloc(2 * sizeof(float));
    int num_dgm = 0;
   
    // Find dgm
    for (int i = 0; i < num_u_points; i++) {
        int c_point = u_points[i].c_point;
        int u_point = u_points[i].u_point;

        int c_obj = c_point;
        int u_obj = u_point;

        while (c_obj != mpatch[c_obj]) {
            c_obj = mpatch[c_obj];
        }
        while (u_obj != mpatch[u_obj]) {
            u_obj = mpatch[u_obj];
        }
    
        if (c_obj != u_obj) {
            if (input[c_obj] > input[u_obj]) {
                mpatch[u_obj] = c_obj;
                if (fabs(input[u_obj] - input[u_point]) > 0.1) {
                    dgm[num_dgm] = inputArray[u_obj];
                    dgm[(num_dgm + 1)] = inputArray[u_point];
                    num_dgm = num_dgm + 2;
                    dgm = realloc(dgm, (num_dgm + 2) * sizeof(float));
                    
                }
            } else {
                mpatch[c_obj] = u_obj;
                if (fabs(input[c_obj] - input[u_point]) > 0.1) {
                    dgm[num_dgm]  = inputArray[c_obj];
                    dgm[(num_dgm + 1)] = inputArray[u_point];
                    num_dgm = num_dgm + 2;
                    dgm = realloc(dgm, (num_dgm + 2) * sizeof(float));
                }
            }
        }
    }

    // Append the maximum and minimum values to dgm
    dgm[num_dgm] = inputArray[argMinMax.argmax];  // Maximum value
    dgm[(num_dgm + 1)] = inputArray[argMinMax.argmin];  // Minimum value
    num_dgm = num_dgm + 2;

    //Clean
    free(input);
    free(mpatch);
    free(u_points);

    Result res = { dgm, num_dgm };
    return res; 
    
}
