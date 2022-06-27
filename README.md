# Guida al prossimo laboratorio
Per realizzare gli esercizi è necessario installare sulla propria macchina alcune applicazioni. Sono applicazioni disponibili per tutti i sistemi operativi, largamente utilizzate, ben documentate e facili da disinstallare.

## Applicazioni da scaricare ed installare sul vostro computer

Sono elencate di seguito due applicazioni con alcune brevi note sull'installazione e l'uso.

### Docker Desktop ([https://www.docker.com/get-started/](https://www.docker.com/get-started/))

E' una applicazizone che ci consente di virtualizzare un host di rete per osservare il funzionamento dei protocolli di comunicazione.

Al link indicato sopra trovate le istruzioni per l'installazione, diverse per i vari sistemi operativi: installate **Docker Desktop** (non Docker Hub). Al termine dell'installazione dovreste avere tra le aplicazioni Docker Desktop, caratterizzato da una icona che rappresenta una balena su fondo azzurro.

Avviando l'applicazione apparirà una finestra e l'icona nella cosiddetta **task bar**, in alto o in basso sullo schermo, dipendemente dalla configurazione.

Non dovrebbe essere necessario utilizzare l'interfaccia grafica, ma l'applicazione deve essere avviata per poter eseguire gli esercizi che richiedono i server virtualizzati. Quindi la finestra può essere subito chiusa, ma nella task-bar resterà presente l'icona. Per interrompere l'applicazione, nel menu collegato all'icona selezionate **Quit Docker Desktop**. Per accedere nuovamente alla dashboard selezionate **Dashboard**. Per svolgere le attività del corso **non** è necessario nessun tipo di sottoscrizione.

Per le attività di laboratorio utilizzeremo le funzionalità di **Docker Desktop** da linea di comando, utilizzando un emulatore di terminale (*command prompt* per Windows)

Al termine delle attività di laboratorio è opportuno interrompere l'applicazione, perchè impegna risorse del PC e può interferire con altre applicazioni.

Saltuariamente, la dashboard potrà esservi utile per rimuovere **containers** e immagini di disco (**images**), usando il menu a sinistra.

### Git ([https://git-scm.com/downloads](https://git-scm.com/downloads))

Git disponibile per tutti i principali sistemi operativi. Le sempllici istruzioni di installazione sono indicate al link.

E' un'applicazione a linea di comando (quindi si usa da emulatore di terminale) per gestire progetti software. E' uno strumento complesso ma prezioso nell'attività di sviluppo. Per l'attività di laboratorio lo utilizzeremo solo per semplificare l'operazione di download del materiale per le esercitazioni.

Dopo averlo installato potete subito provarlo per scaricare in locale il *repository* git che contiene queste istruzioni (e il materiale collegato). Per questo aprite un terminale virtuale e spostatevi in una directory di lavoro. Poi date il comando:

    $ git clone https://github.com/AugustoCiuffoletti/lab_ng/

> **Attenzione**: il comando da eseguire **non** comprende il $ iniziale, che viene inserito solo per indicare che si tratta di un comando da terminale da un account utente.

Il contenuto del repository verrà collocato in una nuova directory `lab-ng`. Ora potete procedere alla costruzione del laboratorio virtuale.

## Costruzione dell'immagine della macchina virtuale con interfaccia grafica

Per costruire il laboratorio è necessario prima procedere alla costruzione di una immagini specifica per la vostra architettura. Il software per la sua costruzione è in repository che dovrete scaricare prima di procedere alla costruzione dell'immagine.

I comandi per realizzare quanto sopra sono riportati sotto. Potete eseguirli nella stessa directory da cui avete eseguito il comando git per l'operazione di clone precedente.

Nel terzo comando, al posto della stringa `<arch>` dovete sostituire una stringa indicativa del vostro sistema:

* amd64: per sistemi Linux, Windows e MacOS con processore AMD
* arm64: per i nuovi sistemi Mac OS con processore ARM

Prestate attenzione al '.' finale del terxzo comando, che va indicato.

    $ git clone https://github.com/fcwu/docker-ubuntu-vnc-desktop
    $ cd docker-ubuntu-vnc-desktop
    $ docker build -f Dockerfile.<arch> -t lab-desktop .

Il comando richiede una decina di minuti per completare, potete trovare altro da fare.

Al termine, per verificare il successo dell'operazione, digitate il seguente comando:

    $ docker run -p 6080:80 lab-desktop

Se non produce errori utilizzate il browser per accedere alla URL `http://localhost:6080`: dovrebbe comparire il desktop grafico della macchina virtuale. Potete provare le icone in basso a sinistra. Al termine digitate CTRL-C nel terminale dove avete precedentemente lanciato il comando `docker run`.

Avete terminato il passo preliminare alla creazione del laboratorio.

## Costruzione delle due macchine del laboratorio e connessione della rete.

Spostatevi nella direcctory dove avete clonato il repository lab_ng. Quindi:

    $ cd ..
    $ cd lab_ng
    $ docker compose up -d

La costruzione del laboratorio è laboriosa e può impiegare molto tempo. Un PC di discreta potenza impiega circa mezz'ora. Al termine dovrebbero comparire sul terminale le seguenti righe:
    
    [+] Running 4/4
     ⠿ Network lab_ng_locale           Created                                 0.3s
     ⠿ Container lab_ng-server-1       Started                                12.5s
     ⠿ Container lab_ng-desktop-1      Started                                14.9s

Provate nuovamente ad accedere alla macchina virtuale dal browser, aprite un terminale e digitate il comando:

    $ ping 172.16.1.3

Se compare una elenco di righe, una al secondo. L'installazione ha avuto successo.

Il laboratorio è così disponibile.

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
