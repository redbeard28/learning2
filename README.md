## Entrainements à Ansible

Exercies sur la mise en place d'un environnement de test sous Vagrant + VirtualBox.

La partie importante est dans le répertoire provision.

Grace à l'appel d'ansible dans le fichier Vagrantfile, les machines sont provisionnées par ansible.

On test les éléments suivants:
- Création des tempaltes jinja
- Création des users + home directory
- Insertion des clés SSH priv/pub via un fichier encrypté sous ansible-vault