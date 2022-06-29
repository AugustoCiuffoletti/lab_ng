# Guida al prossimo laboratorio
Per realizzare gli esercizi è necessario installare sulla propria macchina alcune applicazioni. Sono applicazioni disponibili per tutti i sistemi operativi, largamente utilizzate, ben documentate.

## Applicazioni da scaricare ed installare sul vostro computer

Sono elencate di seguito due applicazioni con alcune brevi note sull'installazione e l'uso.

### Docker Desktop ([https://www.docker.com/get-started/](https://www.docker.com/get-started/))

E' l'applicazizone che ci serve per virtualizzare un host di rete ed osservare il funzionamento dei protocolli di comunicazione.

Al link indicato sopra trovate le istruzioni per l'installazione, diverse per i vari sistemi operativi: installate **Docker Desktop** (non Docker Hub, disponibile alla stessa pagina). Al termine dell'installazione dovreste avere tra le applicazioni Docker Desktop, caratterizzato da una icona che rappresenta una balena su fondo azzurro.

Avviando l'applicazione appariranno una finestra ed una icona nella cosiddetta **task bar**, in alto o in basso sullo schermo, dipendemente dalla configurazione.

Non dovrebbe essere necessario utilizzare l'interfaccia grafica, ma l'applicazione deve essere avviata per poter eseguire gli esercizi che richiedono i server virtualizzati. Quindi la finestra può essere subito chiusa, ma nella *task bar* resterà presente l'icona. Per interrompere l'applicazione, nel menu collegato all'icona selezionate **Quit Docker Desktop**. Per accedere nuovamente alla dashboard selezionate **Dashboard**. Per svolgere le attività del corso **non** è necessario nessun tipo di sottoscrizione.

Per le attività di laboratorio utilizzeremo le funzionalità di **Docker Desktop** da linea di comando utilizzando un emulatore di terminale (*command prompt* per Windows)

Al termine delle attività di laboratorio è opportuno interrompere l'applicazione *Docker Desktop*, perchè impegna risorse del PC e può interferire con altre applicazioni.

Saltuariamente, la dashboard potrà esservi utile per rimuovere **containers** e immagini di disco (**images**), usando il menu a sinistra.

### Git ([https://git-scm.com/downloads](https://git-scm.com/downloads))

Git disponibile per tutti i principali sistemi operativi. Le sempllici istruzioni di installazione sono indicate al link indicato sopra.

E' un'applicazione a linea di comando (quindi si usa da emulatore di terminale) per gestire progetti software. E' uno strumento complesso ma prezioso nell'attività di sviluppo. Per l'attività di laboratorio lo utilizzeremo solo per semplificare l'operazione di download del materiale per le esercitazioni.

Dopo averlo installato potete subito provarlo per scaricare in locale il *repository* git che contiene queste istruzioni e il necessario per creare il laboratorio virtuale. Spostatevi in una directory di lavoro. Poi date il comando:

    $ git clone https://github.com/AugustoCiuffoletti/lab_ng/

> **Attenzione**: il comando da eseguire **non** comprende il $ iniziale, che di norma viene inserito per indicare che si tratta di un comando da terminale da un account utente (invece il simbolo **#** indica un comando da superutente).

Il contenuto del repository verrà collocato in una nuova directory `lab_ng`. Ora potete procedere alla costruzione del laboratorio virtuale.

## Costruzione delle due macchine del laboratorio e connessione della rete.

Spostatevi nella directory prodotta dal comando precedente, quindi avviate il laboratorio virtuale:

    $ cd lab_ng
    $ docker compose up -d

La prima volta che eseguite il comando verranno scaricate le immagini delle due macchine virtuali: serve un po' di tempo e una rete efficiente. Al termine vengono visualizzatele righe:

    Starting server  ... done
    Starting desktop ... done

Per arrestare le macchine virtuali utilizzate la dashboard di **Docker Desktop**. Selezionate lo schermo dei containers e arrestate i containers premendo il tasto quadrato.

Per riavviarlo utilizzate il comando `docker compose up -d`. 

## Verifica dell'installazione 

Avviate il laboratorio omettendo l'opzione `-d`, cioè `docker compose up`. Il comando non termina, ma verrà visualizzata una riga con il contenuto seguente:

    desktop    | 2022-06-29 07:46:53,819 INFO success: novnc entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

Ogni 30 secondi verrà poi visualizzata una riga che attesta il buon funzionamento della macchina desktop:

    desktop    | 127.0.0.1 - - [2022-06-29 07:50:23] "GET /api/health HTTP/1.1" 200 122 0.137451
    
E' possibile accedere alla macchina desktop tramite il browser alla URL `http://localhost:6080`. Aprite un terminale (lo trovate nel menu "System tools" collegato all'icona della rondine, in basso a sinistra) e digitate il comando

    $ ping 172.16.1.3

Se compare una elenco di righe, al ritmo di una al secondo, anche la macchina virtuale server e la rete virtuale sono funzionali.

Il laboratorio è disponibile e configurato per svolgere le attività del corso.

## Analisi del laboratorio

Il laboratorio è composto da tre macchine virtuali (più propriamente *container*):

- desktop: un sistema ubuntu con interfaccia grafica
- server: un server generico per le attività di laboratorio
- lamp-server: il server specifico con il bundle LAMP

Per esaminare la struttura del laboratorio utilizziamo la dashboard di "Docker Desktop".

Selezionando **Containers** nel frame di sinistra viene visualizzato un singolo **bundle** contenente i tre container, collegati insieme sulla slla stessa rete virtuale. Con un click del tasto destro del mouse sul bundle vengono visualizzati i tre *container*. Le icone a destra di ciascuno consentono di eseguire delle operazioni sui container, che per noi sono tre macchine virtuali: accesso, arresto, ricarica e arresto, con icone intuitive.

La macchina virtuale *desktop* ha una icona supplementare: portando il mouse sull'icona viene visualizzato i messaggio **Open with browser**. Cliccando 

L'accesso al laboratorio è tramite il docker con l'interfaccia grafica. Questo è accessibile tramite il browser del PC che ospita i docker all'indirizzo **localhost:6901**. La password da utilizzare per l'accesso è *headless*.

Dall'interfaccia grafica si accede alle altre due macchine aprendo un terminale e utilizzando il comando ssh. Per la macchina server:

    $ ssh user@server

e per la lamp-server:

    $ ssh user@lamp-server

I repo degli esercizi sono diversi da quelli attualmente indicati sui lucidi: sono disponibili con prefisso **https://github.com/AugustoCiuffoletti/** a cui aggiungere il nome del repository (ad esempio https://github.com/AugustoCiuffoletti/stella).

Note:

-) gli esercizi per la copiatura delle chiavi funzionanon tanto con nc (anno 2021) quanto con ssh-copy-id (anni precedenti)

-) il database mysql, su lamp-server localhost è accessibile solo da root con password vuota, quindi è adatto alla realizzazione di un server LAMP con db MySQL

In futuro:

-) fare dei banner esplicativi, reintrodurre conky sul desktop, client mysql sul desktop
