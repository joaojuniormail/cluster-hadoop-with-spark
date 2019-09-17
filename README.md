## Links:

- http://localhost:50070 (Hadoop Informations)
- http://localhost:10002 (HiveServer2)
- http://localhost:16010 (HBase)
- http://localhost:8080 (Spark Web UI)
- http://localhost:18080 (Spark History)

## Install commands

- Copy and rename path to ``/services``
- Changer file ``datanode`` to hostnames the of slaves
- Changer file ``namenode`` to hostname the of master
- ``bash build.sh ssh``
- ``bash build.sh copy``
- ``bash build.sh config``
- ``bash build.sh dfs``