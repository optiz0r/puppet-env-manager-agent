# puppet-env-manager-agent

A [Choria/MCollective](https://choria.io) agent that invokes the `puppet-env-manager`
library to update puppet environments on a puppetserver.

While the `puppet-env-manager` library is not currently open source, this agent is
to demonstrate how a python mcollective agent can be implemented for real world tasks
using [py-mco-agent](https://github.com/optiz0r/py-mco-agent)

# Requirements

* `puppet-env-manager` (closed source for the moment)
* `choria>=0.14`

# Installation

Copy `puppet_env`, `puppet_env.json` and `puppet_env.ddl` to the mcollective agent directory,
usually `/opt/puppetlabs/mcollective/plugins/mcollective/agent/` and restart `choria-server`.

# Usage

```shell script
choria req puppet_env update_all -v
```

```text
Discovering nodes .... 1

1 / 1    0s [====================================================================] 100%

puppetserver.example.com
   {}

---- request stats ----
               Nodes: 1 / 1
         Pass / Fail: 1 / 0
        No Responses: 0
Unexpected Responses: 0
          Start Time: 2019-09-18T22:25:57+0100
      Discovery Time: 2.000441088s
        Publish Time: 0s
          Agent Time: 3m8.087353344s
          Total Time: 3m10.087806976s
```
