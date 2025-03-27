**Certificate Creation and RabbitMQ Broker Configuration Backup Script**
1. In the Root Directory:
    generate_client_server_certs.sh: A Bash script for creating server and client certificates. It generates server certificates in the ServerCerts directory and three client certificates in ClientCerts for a single test device.

    GeneraClient/generate_all_client_certs.sh: A client certificate creation script that, when called with a UUID, generates client certificates signed with the RootCA and the server's private key. It takes a list of serial numbers as input, similar to the example lists found in the same directory.

    genera_lista_certs.sh: Generates a list of serial numbers for production devices.

2. Certificate Persistence:

After the above steps, a directory GeneraClient/Dispositivi/ is created, containing a subdirectory for each device. Each subdirectory stores the certificates and the generated UUID for that device. The Common Name (CN) in the certificate includes this UUID along with the server address.

(A key future development is integrating an LDAP plugin into the broker to verify that the UUID in the certificate matches an entry in the LDAP database. This would add an additional layer of security.)
Cleanup Scripts:

3.   clean.sh: Cleanup scripts that remove generated certificates. Different versions exist, each targeting specific cleanup tasks as indicated by their script names.

4. Auxiliary Scripts:
   generate_client_certs.sh & generate_server_certs.sh: Auxiliary scripts used to regenerate only specific parts of the certificates if needed.

-----------------------------------------------------------
IMPORTANT !!!

the CN used to create server certificates must be the same as for clients


**Script di creazione dei certificati e bkp di configurazione del broker RabbitMQ.**

-----------------------------------------------------------
IMPORTANTE !!!

il CN con cui si creano i certificati server deve essere lo stesso dei client



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
