# puppet-env-manager-agent

A [Choria/MCollective](https://choria.io) agent that invokes the `puppet-env-manager`
library to update puppet environments on a puppetserver.

While the `puppet-env-manager` library is not currently open source, this agent is
to demonstrate how a python mcollective agent can be implemented for real world tasks
using [py-mco-agent](https://github.com/optiz0r/py-mco-agent)

# Requirements

* [py-mco-agent](https://github.com/optiz0r/py-mco-agent) `>=0.3.3`
* [puppet-env-manager](https://github.com/optiz0r/puppet-env-manager) '>=0.4.3'
* [python](https://www.python.org/) `>=3`
* [choria](https://choria.io) `>=0.16.1`

# Installation

This project is packaged up as a puppet module and published to the forge as
`optiz0r-mcollective_agent_puppet_env`. The easiest way to use it is to add this module
to your `Puppetfile`:

```text
mod "optiz0r-mcollective_agent_puppet_env"
```

And `mcollective::plugin_classes` list in hiera:

```yaml
mcollective::plugin_classes:
  - mcollective_agent_puppet_env
```


# Usage

```shell script
choria req puppet_env update_all
```

```text
Discovering nodes .... 1

1 / 1    0s [====================================================================] 100%

puppetserver.example.com

       Added: []
      Failed: []
     Removed: []
   Unchanged: ["development", "production"]
     Updated: []


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

Or with JSON output for integration into other tools:
```shell script
choria req puppet_env update_all -j
```

```text
{
   "agent": "puppet_env",
   "action": "update_all",
   "replies": [
      {
         "sender": "puppetserver.example.com",
         "statuscode": 0,
         "statusmsg": "",
         "data": {
            "added": [],
            "failed": [],
            "removed": [],
            "unchanged": [
               "production",
               "development"
            ],
            "updated": []
         }
      }
   ],
   "request_stats": {
      "requestid": "d8ca514f6ed3498d9d553621f8407e37",
      "no_responses": [],
      "unexpected_responses": [],
      "discovered": 1,
      "failed": 0,
      "ok": 1,
      "responses": 1,
      "publish_time": 0,
      "request_time": 1.9469804,
      "discover_time": 2.0011542,
      "start_time_utc": 1569490017
   },
   "summaries": {}
}
```
