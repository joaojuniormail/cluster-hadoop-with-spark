## Links:

- http://nodemaster:50070 (Hadoop Informations)
- http://nodemaster:10002 (HiveServer2)
- http://nodemaster:16010 (HBase)
- http://nodemaster:8080 (Spark Web UI)
- http://nodemaster:18080 (Spark History)

## Install commands

- Copy and rename path to ``/services``
- Changer file ``datanode`` to hostnames the of slaves
- Changer file ``namenode`` to hostname the of master
- ``bash build.sh ssh``
- ``bash build.sh copy``
- ``bash build.sh config``
- ``bash build.sh dfs``