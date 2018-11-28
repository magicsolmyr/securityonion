{%- set BROVER = salt['pillar.get']('static:broversion', 'COMMUNITY') %}
base:
  'G@role:so-sensor':
    - ssl
    - common
    - firewall
    - pcap
    - suricata
    {%- if BROVER != 'SURICATA' %}
    - bro
    {%- endif %}
    - filebeat
    - schedule

  'G@role:so-eval':
    - ca
    - ssl
    - common
    - firewall
    - master
    - idstools
    - redis
    - elasticsearch
    - logstash
    - kibana
    - pcap
    - suricata
    - bro
    - utility
    - schedule


  'G@role:so-master':
    - ca
    - ssl
    - common
    - firewall
    - master
    - idstools
    - redis
    - elasticsearch
    - logstash
    - kibana
    - utility
    - schedule

  # Storage node logic

  'G@role:so-node and I@node:node_type:parser':
    - match: pillar
    - common
    - firewall
    - logstash
    - schedule

  'G@role:so-node and I@node:node_type:hot':
    - match: pillar
    - common
    - firewall
    - logstash
    - elasticsearch
    - schedule

  'G@role:so-node and I@node:node_type:warm':
    - match: pillar
    - common
    - firewall
    - elasticsearch
    - schedule

  'G@role:so-node and I@node:node_type:storage':
    - match: compound
    - ca
    - ssl
    - common
    - firewall
    - logstash
    - elasticsearch
    - schedule

  'G@role:mastersensor':
    - common
    - firewall
    - sensor
    - master
    - schedule
