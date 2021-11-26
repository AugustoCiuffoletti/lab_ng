# lab_ng

Il laboratorio è composto da tre macchine:

- desktop: il docker con l'interfaccia grafica
- server: il server generico per le attività di laboratorio
- lamp-server: il server specifico con il bundle LAMP

Per avviare le tre macchine il comando network-compose è il seguente,
da lanciare nella directory creata con l'operazione di git clone:

    $ docker-compose up

La prima volta che il comando viene eseguito vengono costruite le immagini per i docker, e il comando impiega una decina di minuti per terminare. Le volte successive il comando termina pochi secondi.

L'accesso al laboratorio è tramite il docker con l'interfaccia grafica.
Questo è accessibile tramite il browser del PC che ospita i docker
all'indirizzo localhost:6901.

Dall'interfaccia grafica si accede alle altre due macchine aprendo
un terminale e utilizzando il comando ssh. Per la macchina server:

    $ ssh user@server

e per la lamp-server:

    $ ssh user@lamp-server

