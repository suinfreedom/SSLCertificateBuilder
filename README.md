**Script di creazione dei certificati e bkp di configurazione del broker RabbitMQ.**


1. nella root dir:
- generate_client_server_certs.sh: script per creare certificati server e client: script bash. Crea i certificati server nella directory ServerCerts e 3 certificati client in ClientCerts per un singolo dispositivo (di test),
- GeneraClient/generate_all_client_certs.sh: è uno script di creazione client che chiamato con uno UUID genera i certificati client firmati con il RootCA e la privateKey del server. Prende come argomento una lista di seriali come quelle di esempio nella stessa dir.
- genera_lista_certs.sh: genera la lista di seriali di dispositivi di prod.

2. persistenza dei certificati:
- dopo il passo precedente viene creata una directory GeneraClient/Dispositivi/ contenente una directory per dispositivo con i certificati e lo uuid generato per quel dispositivo (il CN usato nel certificato oltre all'indirizzo del server contiene questo uuid).
  (Un importante sviluppo futuro è quello di aggiungere un plugin LDAP al broker per fare un ulteriore controllo del match tra questo parametro UUID e l'entry del db ldap. A questo punto avremo un ulteriore layer di sicurezza)
  
3. clean.sh:    gli script di clean ripuliscono il progetto dai certificati creati, ve ne sono diversi a seconda dell'obiettivo, specificato nel nome degli script.

4. gli altri script di creazione (generate_client_certs.sh, generater_server_certs.sh) sono script ausiliari nel caso si vuole rigenerare solo parte dei certificati.
 



-----------------------------------------------------------
IMPORTANTE !!!

il CN con cui si creano i certificati server deve essere lo stesso dei client
