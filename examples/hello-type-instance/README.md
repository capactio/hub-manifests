# Description

Simple hello world example. Depending on policy one of two implementation is used.

Presented features:

- [Interface](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#interface)
- [Implementation](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#implementation)
- [Attributes](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#attribute)
- [Types and TypeInstances](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#type)
- [Policies](https://capact.io/docs/next/feature/policies/overview)

# Testing

1. Create a new action

   ```bash
   capact act create --name hello cap.interface.capactio.capact.examples.hello-type-instance.say
   ```

1. Wait for the action to have a status `READY_TO_RUN`. To get a status run:

   ```bash
   capact act get hello
   ```

1. When status is `READY_TO_RUN`, run the action:

   ```bash
   capact act run hello
   ```

1. Watch the progress:

   ```bash
   capact act watch hello
   ```

1. When command finished, note the name of the last Pod. It's in the column `PODNAME`. See it's logs:

   ```bash
   kubectl logs <PODNAME> main
   ```

1. Delete the action:

   ```bash
   capact act delete hello
   ```

Sometimes you don't want just to say Hello. Sometimes you want to SCREAM HELLO. Capact allows you to do it :)

The policy file allows you to choose a different implementation which says "Hello". This time it will be louder. Create the action again and pass the new policy:

```bash
capact act create --name hello cap.interface.capactio.capact.examples.hello-type-instance.say --action-policy-from-file ./policy.yaml
```

Repeat steps starting from **Wait for the action to have a status `READY_TO_RUN`.**
