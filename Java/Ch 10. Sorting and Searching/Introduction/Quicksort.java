package Introduction;

import CtCILibrary.AssortedMethods;

public class Quicksort {
	public static void swap(int[] array, int i, int j) {
		int tmp = array[i];
		array[i] = array[j];
		array[j] = tmp;
	}

	public static int partition(int[] array, int leftIndex, int rightIndex) {
		int pivot = array[leftIndex + (rightIndex - leftIndex) / 2]; // Pick a pivot point. Can be an element		
		
		while (leftIndex <= rightIndex) { // Until we've gone through the whole array
			// Find element on left that should be on right
			while (array[leftIndex] < pivot) { 
				leftIndex++;
			}
			
			// Find element on right that should be on left
			while (array[rightIndex] > pivot) {
				rightIndex--;
			}
			
			// Swap elements, and move left and right indices
			if (leftIndex <= rightIndex) {
				swap(array, leftIndex, rightIndex);
				leftIndex++;
				rightIndex--;
			}
		}
		return leftIndex; 
	}

	public static void quickSort(int[] array, int leftIndex, int rightIndex) {
		int index = partition(array, leftIndex, rightIndex); 
		if (leftIndex < index - 1) { // Sort left half
			quickSort(array, leftIndex, index - 1);
		}
		if (index < rightIndex) { // Sort right half
			quickSort(array, index, rightIndex);
		}
	}

	public static void main(String[] args) {
		int[] array = AssortedMethods.randomArray(20, 0, 6);
		AssortedMethods.printIntArray(array);	
		quickSort(array, 0, array.length - 1);
		AssortedMethods.printIntArray(array);
	}

}
