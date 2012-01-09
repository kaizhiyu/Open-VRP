;;; Mon Jun 21, 2011 (c) Marc Kuo
;;; Nearest Neighborhood algorithm (greedy) for TSP (NOT defined for VRP!)
;;; -----
;;; Start at base, and keep choosing the next closest one
(in-package :open-vrp.algo)    

;; Greedy NN algo for TSP problem (no fleet)

(defmethod run-algo ((p tsp) (a greedy-NN))
  "While there exists unchosen nodes, keep appending it. Returns the <Algo> object when done. Also prints the fitness and solution (run-algo :after method)."
  (let ((net (problem-network p))
	(v (vehicle p 0)))
    (awhile (closest-node v
			  net
			  (route-indices v))
      (append-node v it)))
  (setf (algo-best-sol a) p
	(algo-current-sol a) p
	(algo-best-fitness a) (fitness p))
  a)