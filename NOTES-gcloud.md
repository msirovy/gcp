


Presun projectu pod jinou organizaci
------------------------------------

```
gcloud components install alpha
gcloud organizations add-iam-policy-binding ORGANIZATION_ID --member your-user --role roles/resourcemanager.projectCreator
gcloud organizations add-iam-policy-binding ORGANIZATION_ID --member your-user --role roles/resourcemanager.projectMover
gcloud projects add-iam-policy-binding PROJECT_NAME --member your-user --role roles/resourcemanager.projectMover
gcloud projects move PROJECT_NAME --organization=ORGANIZATION_ID
```
(nejsem si jisty jestli neni potreba jeste nejake pravo, ale ono si to rekne)



Presun DNS mezi projekty
------------------------
```
gcloud --project PROJECT_NAME dns record-sets export exported_zone.yml -z ZONE_NAME
gcloud --project PROJECT_NAME dns record-sets import exported_zone.yml -z ZONE_NAME
```


Prace s DNS
-----------
```
# zalozeni
gcloud dns managed-zones create ZONE_NAME --dns-name=FQDN --description="nejaky popisek"

# vypsani dns zaznamu
gcloud --project PROJECT_NAME dns record-sets list -z ZONE_NAME

```

