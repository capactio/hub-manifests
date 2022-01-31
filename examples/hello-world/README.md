# Description

The Hello World example showcases interchangeability of dependencies and TypeInstance generation.

The example consists of the following manifests:

| **Types**                                                                                   |
|---------------------------------------------------------------------------------------------|
| [`cap.type.capactio.examples.message`](../../manifests/type/capactio/examples/message.yaml) |

| **Attributes**                                                                                                  |
|-----------------------------------------------------------------------------------------------------------------|
| [`cap.attribute.capactio.examples.be-positive`](./../../manifests/attribute/capactio/examples/be-positive.yaml) |

| **Interfaces**                                                                                      | **Implementations**                                                                                                                                                                                                            |
|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`cap.interface.capactio.examples.greet`](./../../manifests/interface/capactio/examples/greet.yaml) | [`cap.implementation.capactio.examples.greet`](../../manifests/implementation/capactio/examples/greet.yaml)                                                                                                                    |
| [`cap.interface.capactio.examples.say`](./../../manifests/interface/capactio/examples/say.yaml)     | [`cap.implementation.capactio.examples.hello`](../../manifests/implementation/capactio/examples/hello.yaml) <br /> [`cap.implementation.capactio.examples.ricky`](../../manifests/implementation/capactio/examples/ricky.yaml) |


## Steps

1. Create a new Action:

	 ```bash
	 capact act create --name hello cap.interface.capactio.examples.greet
	 ```

1. Wait for the Action to have the `READY_TO_RUN` status:

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

1. Get the Action output (TypeInstance). Copy the `id` field value:

	 ```bash
	 capact act get hello -ojson | jq '.Actions[0].output.typeInstances'
	 ```

	 Example output:
	 ```bash
    [
      {
        "id": "08fcaa07-7846-47af-b6a7-7c3818c69656",
        "typeRef": {
          "path": "cap.type.capactio.examples.message",
          "revision": "0.1.0"
        }
      }
    ]
	 ```

1. Get the TypeInstance `value.message` field value:

	 ```bash
	 capact ti get {ID} -ojson | jq -r '.[0].latestResourceVersion.spec.value.message'
	 ```

1. Delete the Action:

	 ```bash
	 capact act delete hello
	 ```

What if you wanted to output a different message, that reminds you about a masterpiece song you can listen to endlessly? With Capact that's really easy ✨

To choose a different Implementation for the `say` Interface, we need to prepare a dedicated Policy. The power of it is that you don't have to change the main workflow. You treat the step as a building block and just swap it for another existing one.

Create the Action again, and pass [the Action Policy](./policy.yaml):

```bash
capact act create --name hello cap.interface.capactio.examples.greet --action-policy-from-file ./policy.yaml
```

Repeat steps starting from **Wait for the Action to have the `READY_TO_RUN` status**.
