See also https://hub.docker.com/r/google/cloud-sdk/

I didn't reuse this Google Docker file because it was missing the Datastore emulator and it can't be added

# Auth & save the credentials in gcloud-config volumes:
```bash
$ docker run -t -i --name gcloud-config google/cloud-sdk gcloud init
```

# If you would like to use service account instead please look here:
```bash
$ docker run -t -i --name gcloud-config google/cloud-sdk gcloud auth activate-service-account <your-service-account-email> --key-file /tmp/your-key.p12 --project <your-project-id>
```
