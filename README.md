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


## Testing

To run this role's integration tests

```
kitchen test
```


## Dependencies

none
