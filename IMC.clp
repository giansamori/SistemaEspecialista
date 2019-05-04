(defglobal
?*g_resultado* = 0
)


(deftemplate Peso
20 150 PesoKg
((Faixa1 (z 20 30))
(Faixa2 (28 0)(31 1)(40 1)(43 0))
(Faixa3 (38 0)(41 1)(50 1)(53 0))
(Faixa4 (48 0)(51 1)(70 1)(73 0))
(Faixa5 (68 0)(71 1)(100 1)(103 0))
(Faixa6 (s 101 150))
)
)
(plot-fuzzy-value t "@#$%?*" 0 150
(create-fuzzy-value Peso Faixa1)
(create-fuzzy-value Peso Faixa2)
(create-fuzzy-value Peso Faixa3)
(create-fuzzy-value Peso Faixa4)
(create-fuzzy-value Peso Faixa5)
(create-fuzzy-value Peso Faixa6))

(deftemplate altura
100 250 alturaemCM
((baixa(z 100 160))
(media (160 0)(165 1)(175 1)(180 0))
(alta (S 181 250))
)
)
(plot-fuzzy-value t "+*-" 120 250
(create-fuzzy-value altura baixa)
(create-fuzzy-value altura media)
(create-fuzzy-value altura alta))


(deftemplate IMC
0 50 IMC_IMC
((baixa (z 0 18))
(normal (10 0)(18 1)(20 1)(24 0))
(acima (20 0)(25 1)(27 1)(29 0))
(obeso1 (27 0)(30 1)(32 1)(35 0))
(obeso2 (S 33 40))
)
)
(plot-fuzzy-value t "BNA12" 0 50
(create-fuzzy-value IMC baixa)
(create-fuzzy-value IMC normal)
(create-fuzzy-value IMC acima)
(create-fuzzy-value IMC obeso1)
(create-fuzzy-value IMC obeso2))

(defrule bx
(declare (salience 10))
(or(and(Peso Faixa1)(altura baixa))
(and(Peso Faixa1)(altura media))
(and(Peso Faixa1)(altura alta))
(and(Peso Faixa2)(altura media))
(and(Peso Faixa2)(altura alta))
(and(Peso Faixa3)(altura media))
(and(Peso Faixa3)(altura alta))
(and(Peso Faixa4)(altura alta))
(and(Peso Faixa5)(altura alta)))
=>
 (assert (IMC baixa))
)

(defrule normal
  (declare(salience 10))
  (or(and(Peso Faixa2)(altura baixa))
  (and(Peso Faixa4)(altura media)))
=>
(assert (IMC normal))
)

(defrule aci
  (declare(salience 10))
  (or(and(Peso Faixa3)(altura baixa))
  (and(Peso Faixa5)(altura media))
  (and(Peso Faixa6)(altura alta)))
=>
(assert (IMC acima))
)

(defrule ob1
  (declare(salience 10))
  (Peso Faixa4)
  (altura baixa)
=>
(assert (IMC obeso1))
)

(defrule ob2
(declare (salience 10))
(or(and(Peso Faixa5)(altura baixa))
(and(Peso Faixa6)(altura baixa))
(and(Peso Faixa6)(altura media)))
=>
 (assert (IMC obeso2))
)
;-----------------------------------------------------------------------------

(defrule defuzifica
  (declare (salience 0))
  ?v_IMC <- (IMC ?)
  =>
  (bind ?*g_resultado* (moment-defuzzify ?v_IMC))

  (retract ?v_IMC)
  (printout t "O IMC é: ")
  (printout t ?*g_resultado* crlf)
  (printout t ">>> Término <<<" crlf)
  )

  (deffacts IMC
(Peso Faixa3)
(altura media))
