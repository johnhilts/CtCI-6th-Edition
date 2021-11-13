(defpackage #:interview-code
  (:use #:cl))

(in-package #:interview-code)

(defmacro while (conditions &rest body)
  `(do
    () ;; empty declaration section
    ((not ,conditions))
     ,@body))

(defun swap (array index-a index-b)
  "Swap 2 elements in an array."
  (let ((temp (aref array index-a)))
    (setf (aref array index-a) (aref array index-b))
    (setf (aref array index-b) temp)))

(defun partition (array left-index right-index)
  (let ((pivot (aref array (floor (+ left-index (/ (- right-index left-index) 2))))));; Pick a pivot point. Can be an element

    (while (<= left-index right-index) ;; Until we've gone through the whole array

      ;; Find element on left that should be on right
      (while (< (aref array left-index) pivot)
	(incf left-index))

      ;; Find element on right that should be on left
      (while (> (aref array right-index) pivot)
	(decf right-index))

      ;; Swap elements, and move left and right indices
      (when (<= left-index right-index)
	(swap array left-index right-index)
	(incf left-index)
	(decf right-index)))

    left-index))

(defun quick-sort (array left-index right-index)
  "Quick Sort implementation."
  (let ((index (partition array left-index right-index)))
   ; (break)
    (when (< left-index (- index 1)) ;; Sort left half
      (quick-sort array left-index (- index 1)))
    (when (< index right-index) ;; Sort right half
      (quick-sort array index right-index))))

(defun random-array (size max)
  "Generate an array populated with random integers."
  (let ((a (make-array size :initial-contents (let ((a ())) (dotimes (i size a) (push (random max) a))))))
    a))

(defun quicksort-main ()
  "Entry point for Quicksort."
  (let ((array (random-array 20 6)))
    (print array)
    (quick-sort array 0 (- (length array) 1))
    (print array)))

