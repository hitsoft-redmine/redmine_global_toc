# Redmine Global Toc plugin

This is a plugin for Redmine with wiki macro that collects all projects available to the user and form the global Redmine Table of Content with links to all wikis for the user. 

## Example

#### Projects structure
* Private — private project user do not have access to with wiki
  * Public Child — public subproject without wiki
* Public — public project with wiki (not initialized)
  * Private Child — private subproject user have access to with wiki (not initalized)
* test — public project

![](.README_images/project_structure.png)

#### Wiki format
```
{{global_toc}}
```

#### Resulting view
![](.README_images/global_toc.png)

## Installation

1. Clone or copy files into the Redmine plugins directory
   ```
   git clone https://github.com/hitsoft-redmine/redmine_global_toc.git plugins/redmine_global_toc
   ```
2. Restart Redmine

## License

[LGPL-3.0](LICENSE)