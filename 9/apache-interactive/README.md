# DrupalCi drupal:9-apache-interactive

This container will not run tests automatically.
It is useful to perform manual tasks for the purpuses of debugging.

To run it

```bash
docker run --rm --name drupal8 -p 8080:80 -d dennisdigital/drupalci:9-apache-interactive
```

Then, access it via http://localhost:8080 or http://host-ip:8080 in a browser.

To get into the container

```bash
docker exec -it drupal8 /bin/sh
```

or

```bash
docker exec -it drupal8 bash
```
