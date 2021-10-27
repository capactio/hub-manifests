# Description

A bit more advanced "hello world" example, where TypeInstance is used. There are two Implementations for a given Interface. Depending on the Policy, a different Implementation is selected.

Running this example you will learn about the following Capact concepts:

- [Interface](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#interface)
- [Implementation](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#implementation)
- [Attributes](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#attribute)
- [Types and TypeInstances](https://github.com/capactio/capact/blob/main/ocf-spec/0.0.1/README.md#type)
- [Policies](https://capact.io/docs/next/feature/policies/overview)

## Instruction

1. Create a new Action:

   ```bash
   capact act create --name hello cap.interface.capactio.capact.examples.hello-type-instance.greet
   ```

1. Wait for the Action to have the `READY_TO_RUN` status. To its status run:

   ```bash
   capact act get hello
   ```

1. When the status is `READY_TO_RUN`, run the Action:

   ```bash
   capact act run hello
   ```

1. Watch the progress:

   ```bash
   capact act watch hello
   ```

1. Once the Action is finished, note the name of the Pod for the `print` workflow step (column `PODNAME`). Read its logs with the following command:

   ```bash
   kubectl logs <PODNAME> main
   ```

1. Delete the Action:
	
    ```bash
    capact act delete hello
    ```
	
Sometimes you don't want to just say "hello". Sometimes you want to scream "HELLO!". Capact allows you to do it 🙂
	
The Policy file allows you to choose a different Implementation for the `say` Interface. This time it will be louder. Create the Action again, and pass [the Action Policy](./policy.yaml):

```bash
capact act create --name hello cap.interface.capactio.capact.examples.hello-type-instance.greet --action-policy-from-file ./policy.yaml
```

Repeat steps starting from **Wait for the action to have a status `READY_TO_RUN`.**
