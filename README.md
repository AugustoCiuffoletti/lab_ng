# Guida al laboratorio virtuale del corso di Protocolli e Servizi di Rete
Per realizzare gli esercizi è necessario installare sulla propria macchina alcune applicazioni. Sono disponibili per tutti i sistemi operativi, largamente utilizzate, ben documentate.

## Applicazioni da scaricare ed installare sul vostro computer

Sono elencate di seguito due applicazioni con alcune brevi note sull'installazione e l'uso.

### Docker Desktop ([https://www.docker.com/get-started/](https://www.docker.com/get-started/))

E' l'applicazione che ci serve per virtualizzare una rete di computer ed osservare il funzionamento dei protocolli di comunicazione.

Al link indicato sopra trovate le istruzioni per l'installazione, diverse per i vari sistemi operativi: installate **Docker Desktop** (non Docker Hub, disponibile alla stessa pagina). Per svolgere le attività del corso **non** è necessario nessun tipo di sottoscrizione. L'installazione deve avvenire da account **amministratore**.

Al termine dell'installazione dovreste avere tra le applicazioni Docker Desktop, caratterizzato da una icona con una balena su fondo azzurro.

Al termine delle attività di laboratorio è opportuno chiudere l'applicazione *Docker Desktop*, perchè impegna risorse del PC e può interferire con altre applicazioni.

Dalla dashboard è possibile gestire **containers** e immagini di disco (**images**). Useremo poche funzioni della dashboard.

### Git ([https://git-scm.com/downloads](https://git-scm.com/downloads))

Git è disponibile per tutti i principali sistemi operativi. Le istruzioni di installazione sono indicate al link indicato sopra.

E' un'applicazione a linea di comando (quindi si usa da emulatore di terminale) per gestire progetti software. E' uno strumento complesso ma prezioso nell'attività di sviluppo. Per l'attività di laboratorio lo utilizzeremo solo per semplificare l'operazione di download del materiale per le esercitazioni.

### Download del software per il laboratorio virtuale

Dopo aver installato **git** scaricate in locale il *repository* git contiene queste istruzioni e il necessario per creare il laboratorio virtuale. Per farlo date il comando:

    $ git clone https://github.com/AugustoCiuffoletti/lab_ng/

> **Attenzione**: il comando da eseguire **non** comprende il $ iniziale, che di norma viene inserito per indicare che si tratta di un comando da terminale da un account utente (invece il simbolo **#** indica un comando da superutente).

Il contenuto del repository verrà collocato in una nuova directory `lab_ng`. Ora potete procedere alla costruzione del laboratorio virtuale.

## Costruzione delle due macchine del laboratorio e connessione della rete.

Spostatevi nella directory prodotta dal comando precedente, quindi avviate il laboratorio virtuale:

    $ cd lab_ng
    $ docker compose up

La prima volta che eseguite il comando verranno scaricate le immagini delle due macchine virtuali: serve un po' di tempo e una rete efficiente. Verrà visualizzato l'andamento del download, e al termine le righe:

    Starting server  ... done
    Starting desktop ... done
    Starting lamp ... done

Ciascun container viene generato a partire da *immagini* di dischi virtuali: in pratica la macchina virtuale trova nell'*immagine* il proprio sistema operativo e i dati utente, analogamente ad un normale PC. Il comando visto sopra, in assenza delle *immagini* in locale, le scarica prima da un repository ([https://hub.docker.com/](https://hub.docker.com/)), poi costruisce il container e lo avvia. Se *immagine* e *container* sono già presenti si limita ad avviare il *container*.

Per arrestare i *container* che realizzano le macchine virtuali del laboratorio utilizzate la dashboard di **Docker Desktop**. Selezionate lo schermo dei container e premete il tasto quadrato nella riga **lab_ng**. Per riavviarlo utilizzate il tasto triangolare, o in alternativa il comando da terminale `docker compose up -d`.

## Verifica dell'installazione e *guided tour*

Il laboratorio è composto da tre macchine virtuali realizzate da altrettanti container:

- desktop: un sistema ubuntu con desktop grafico
- server: un server generico
- lamp: un server *old style" che integra web server e database MySQL

Per verificare l'installazione avviate il laboratorio dal teminale omettendo l'opzione `-d`, cioè `docker compose up`. Il comando non termina all'avvio dei container,, ma visualizza l'avanzamento dell'avvio delle tre macchine. In particolare la riga conclusiva per l'installazione della macchina desktop è la seguente:

    desktop    | 2022-06-29 07:46:53,819 INFO success: novnc entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

Ogni 30 secondi verrà poi visualizzata una riga che attesta il buon funzionamento della macchina desktop:

    desktop    | 127.0.0.1 - - [2022-06-29 07:50:23] "GET /api/health HTTP/1.1" 200 122 0.137451
    
E' possibile accedere alla macchina desktop tramite il browser del vostro PC alla URL `http://localhost:6080`. Comparirà il desktop di un sistema Linux Ubuntu con interfaccia LXDE.

L'accesso alle altre macchine, *server* e *lamp* avviene tramite un terminale sulla macchina desktop. Per verificare l'accessibilità delle due macchie usate il comando *ping*: aprite un terminale (lo trovate nel menu "System tools" collegato all'icona della rondine, in basso a sinistra) e digitate il comando

    $ ping server

Se compare una elenco di righe, al ritmo di una al secondo, anche la macchina virtuale server e la rete virtuale sono funzionali. Utilizzate lo stesso comando per verificare la macchina lamp.

Per accedere alla macchina *server* (sarà necessario nelle attività di laboratorio) utilizzate il comando seguente:

    $ ssh server

Per tutte le macchine virtuali il nome utente è *user* con password *user*.Il terminale si collegherà alla macchina *server* e potrete quindi digitare comandi per quella macchina. Con la stessa modalità potete *entrare* nella macchina *lamp*.

## Analisi del laboratorio

Per esaminare la struttura del laboratorio utilizziamo la dashboard di "Docker Desktop".

Selezionando **Containers** nel frame di sinistra viene visualizzato un singolo **bundle** contenente i tre container, collegati insieme sulla sulla stessa rete virtuale. Con un click del tasto destro del mouse sul bundle vengono visualizzati i tre *container*. Le icone a destra di ciascuno consentono di eseguire delle operazioni sui container, che per noi sono tre macchine virtuali: accesso, avvio/arresto, ricarica e rimozione, con icone intuitive. Le icone di accesso possono essere due, se esiste anche un accesso web oltre a quello via terminale.

Ciò accade per la macchina virtuale *desktop*, che ha un tasto che visualizza il messaggio **Open with browser**. Premendolo si viene riportati sul browser, su cui viene aperta la finestra di accesso alla macchina virtuale come visto sopra. 

Con l'altro tasto di accesso si accede ad un terminale in esecuzione come root. E' una opzione che non utilizzeremo, preferendo l'accesso tramite la macchina desktop come visto nel *guided tour*.

Le macchine virtuali condividono la directory `shared`. Serve per scambiare contenuti in modo molto semplice tra le diverse macchine virtuali.

La directory condivisa `shared` è collocata in posizioni diverse ma ben visibili nelle tre macchine virtuali:

* nella macchina reale (chiamata **host**) è nella directory da cui avete lanciato il comando `docker compose`. Viene creata la prima volta che il comando viene invocato
* nella macchina **server** è nella home dell'utente `user`
* nella macchina **desktop** è ben visibile sul desktop

I contenuti delle tre directory sono sempre sincronizzati: modificando uno si modificano anche gli altri. Alcune operazioni, come la rimozione di un file, possono richiedere i privilegi di superutente (`sudo`).

### Svolgimento degli esercizi di laboratorio

I repo degli esercizi sono diversi da quelli attualmente indicati sui lucidi: sono disponibili con prefisso **https://github.com/AugustoCiuffoletti/** a cui aggiungere il nome del repository (ad esempio https://github.com/AugustoCiuffoletti/stella).

Note:

-) gli esercizi per la copiatura delle chiavi funzionanon tanto con nc (anno 2021) quanto con ssh-copy-id (anni precedenti)

-) il database mysql (non ancora disponibile), su lamp-server localhost è accessibile solo da root con password vuota, quindi è adatto alla realizzazione di un server LAMP con db MySQL
