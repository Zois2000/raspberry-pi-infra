FROM python:3.13.15-slim

# SSH-Client installieren, damit Ansible entfernte Hosts erreichen kann.
RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Ansible-Version für reproduzierbare Builds fest pinnen.
RUN pip install --no-cache-dir ansible==14.4.0

# Startskript kopieren und ausführbar machen.
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Arbeitsverzeichnis für Inventory, Playbooks und Rollen.
WORKDIR /ansible

# Ansible-Konfiguration explizit festlegen, da Windows-Bind-Mounts
# innerhalb des Containers als world-writable erscheinen können.
ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

# Bereitet beim Containerstart SSH-Key und known_hosts vor.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Standardbefehl, falls kein anderer Befehl angegeben wird.
CMD ["ansible", "--version"]