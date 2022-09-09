# Per lo sviluppatore

Non è opportuno includere nel repo la directory `shared` perchè Docker ne modifica i diritti di accesso ed eventuali contenuti registrati possono intralciare una successiva operazione di *pull*.

Nell'ambiente di esecuzione, il valore della variabile d'ambiente TAG controlla il tag delle immagini utilizzate. Se non definita o vuota si utilizza il tag *stable*.

    $ TAG=latest docker compose up

Di regola si usa il tag *stable* per indicare l'immagine attualmente testata su ambedue le piattaforme, e *latest* per quella sotto test.