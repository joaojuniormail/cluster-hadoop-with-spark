## Links:

- http://localhost:50070 (Hadoop Informations)
- http://localhost:10002 (HiveServer2)
- http://localhost:16010 (HBase)
- http://localhost:8080 (Spark Web UI)
- http://localhost:18080 (Spark History)

## Install commands

1. Copy and rename path to ``/services``
2. Changer file ``datanode`` to hostnames the of slaves
3. Changer file ``namenode`` to hostname the of master
4. ``bash build.sh ssh``
5. ``bash build.sh copy``
6. ``bash build.sh config``
7. ``bash build.sh dfs``
8. ``bash ./scripts/start-all.sh``
9. ``bash build.sh spark``
