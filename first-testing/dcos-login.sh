#!/bin/bash
#dcos config set core.dcos_url 3.89.244.129
dcos config set core.dcos_url dcos-ElasticLoadBa-1M2WM8B24SRQ1-1484387603.us-east-1.elb.amazonaws.com 
dcos config set core.ssl_verify false
dcos auth login --username bootstrapuser --password deleteme
