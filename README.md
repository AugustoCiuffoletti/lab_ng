# Guida al prossimo laboratorio

Il laboratorio è composto da tre macchine:

- desktop: il docker con l'interfaccia grafica
- server: il server generico per le attività di laboratorio
- lamp-server: il server specifico con il bundle LAMP

Per avviare le tre macchine il comando network-compose è il seguente,
da lanciare nella directory creata con l'operazione di git clone:

    $ docker-compose up

E' necessario lanciare il comando come amministratore, con la modalità dipendente dal sistema operativo.

La prima volta che il comando viene eseguito vengono costruite le immagini per i docker, e il comando impiega una decina di minuti per terminare. Le volte successive il comando termina pochi secondi.

L'accesso al laboratorio è tramite il docker con l'interfaccia grafica. Questo è accessibile tramite il browser del PC che ospita i docker all'indirizzo **localhost:6901**. La password da utilizzare per l'accesso è *headless*.

Dall'interfaccia grafica si accede alle altre due macchine aprendo un terminale e utilizzando il comando ssh. Per la macchina server:

    $ ssh user@server

e per la lamp-server:

    $ ssh user@lamp-server

I repo degli esercizi sono diversi da quelli attualmente indicati sui lucidi: sono disponibili con prefisso **https://github.com/AugustoCiuffoletti/** a cui aggiungere il nome del repository (ad esempio https://github.com/AugustoCiuffoletti/stella).

In sospeso:

-) gli esercizi con ssh-copy-id non funzionano, bisogna copiare la chiave con scp

     $ ssh-keygen
     $ scp /root/.ssh/id_rsa.pub user@server:.ssh/authorized_hosts

Funziona anche con ssh-copy-i ma creando la directory /home/headless/.ssh e poi ssh-copy-id -i /root/.ssh/id_rsa user@server (credo).

-) da provare mysql, dal localhost si accede root con password vuota

In futuro:
-) rifare il desktop con utente user
-) fare dei banner esplicativi, reintrodurre conky sul desktop, client mysql sul desktop
