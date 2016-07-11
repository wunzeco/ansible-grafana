grafana
=======

Ansible role to install and configure Grafana.


## Example

```
- hosts: myhost

  vars:
    grafana_version: 3.0.4
    
  roles:
    - wunzeco.grafana
```

By default, grafana plugins are updated if an update is available. This may be
turned off by setting `grafana_update_plugins` to `false`.


## Testing

To run this role's integration tests

```
kitchen test
```


## Dependencies

none
