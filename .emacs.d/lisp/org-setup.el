;;-*- coding: utf-8-unix; -*-
;; Org mode setup
(let ((default-directory "~/Dropbox/planner"))
  (setq inbox-file (expand-file-name "inbox.org"))
  (setq planner-file (expand-file-name "planner.org"))
  (setq tickler-file (expand-file-name "ticlker.org"))
  (setq someday-file (expand-file-name "someday.org"))
  (setq journal-file (expand-file-name "journal.org"))
  (setq meetings-file (expand-file-name "meetings.org")))

(require 'org)
(setq org-agenda-files `(,inbox-file
			 ,planner-file
			 ,tickler-file))

(setq org-capture-templates `(("j" "Journal" entry
			       (file+datetree ,journal-file)
			       "* %?\nEntered on %U\n  %i\n  %a")
			      ("t" "Todo [inbox]" entry
			       (file+headline ,inbox-file "Tarefas")
			       "* TODO %i%?")
			      ("n" "Notes [inbox]" entry
			       (file+headline ,inbox-file "Notas")
			       "* %i%?")
			      ("m" "Meeting" entry
			       (file+headline ,meetings-file "Meetings")
			       "* %i%?")
			      ("T" "Tickler" entry
			       (file+headline ,tickler-file "Tickler")
			       "* %i%? \n %U")))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

(defun daily-agenda ()
  (interactive)
  (org-agenda-list 1)
  )

(define-key global-map "\C-cd" 'daily-agenda)

(setq org-refile-targets `((,planner-file :maxlevel . 3)
			   (,someday-file :level . 1)
			   (,tickler-file :maxlevel . 2)))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states) ;turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
