; **************************************************************************** ;
;                                                           LE - /             ;
;                                                               /              ;
;    game_of_life.lsp                                 .::    .:/ .      .::    ;
;                                                  +:+:+   +:    +:  +:+:+     ;
;    By: igbraude <marvin@le-101.fr>                +:+   +:    +:    +:+      ;
;                                                  #+#   #+    #+    #+#       ;
;    Created: 2019/01/12 18:48:12 by igbraude     #+#   ##    ##    #+#        ;
;    Updated: 2019/01/12 18:48:12 by igbraude    ###    #+. /#+    ###.fr      ;
;                                                          /                   ;
;                                                         /                    ;
; **************************************************************************** ;

(ql:quickload "lispbuilder-sdl")
;;(load "ft_carnifex/usage.lsp")

(defparameter *max_y* 5120)
(defparameter *max_x* 2180)

(defparameter *y* NIL)
(defparameter *x* NIL)

(defun main (argv)

	;;; affichage des argument
	;;; Cas d'erreur pre map
	(format t "0 : ~$~%1 : ~$~%2 ~$~%" (nth 1 argv) (nth 2 argv) (nth 3 argv))
	(if (or (eq (length argv) 1) (eq (nth 2 argv) NIL) (eq (nth 1 argv) "-h") (eq (nth 1 argv) "--help") (not (eq (nth 3 argv) NIL)))
		(progn(format t "usage: sbcl --load game_of_life.lsp [-h] width height
	   
positional arguments:
	width				width of the grid
		 
	height				height of the grid
		 
optianal arguments:
	-h, --help			show this help message and exit~%")
			(exit)
		)
	  )
	(progn(setq *y* (parse-integer (second argv)))
		(setq *x* (parse-integer (third argv))))
	(if (or (< *y* 1) (< *x* 1) (> *x* *max_x*) (> *y* *max_y*))
		(progn(format t "Look at the MAC Displays what are you trying to do ?~%")
		(exit)
		)
	)
;	(if (> 5120 (nth 1 argv))
	; (format t "Look for MAC Max width"))
	;;; affichage des argument
	;	(format t "argv[1] = ")
	;	(format t  *x*)
	;	(format t "    argv[2] = ")
	;	(format t *y*)
	(exit)
  )
(sb-int:with-float-traps-masked (:invalid :inexact :overflow) (main *posix-argv*))
