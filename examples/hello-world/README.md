# Description

The Hello World example showcases interchangeability of dependencies and TypeInstance generation.

The example consists of the following manifests:

| **Types**                                                                                      |
|------------------------------------------------------------------------------------------------|
| [cap.type.capactio.examples.message](../../manifests/type/capactio/examples/message.yaml) |

| **Attributes**                                                                                                |
|---------------------------------------------------------------------------------------------------------------|
| [cap.attribute.capactio.examples.be-positive](./../../manifests/attribute/capactio/examples/be-positive.yaml) |

| **Interfaces**                                                                                    | **Implementations**                                                                                                                                                                                                          |
|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [cap.interface.capactio.examples.greet](./../../manifests/interface/capactio/examples/greet.yaml) | [cap.implementation.capactio.examples.greet](../../manifests/implementation/capactio/examples/greet.yaml)                                                                                                                  |
| [cap.interface.capactio.examples.say](./../../manifests/interface/capactio/examples/say.yaml)     | [cap.implementation.capactio.examples.hello](../../manifests/implementation/capactio/examples/hello.yaml) <br /> [cap.implementation.capactio.examples.ricky](../../manifests/implementation/capactio/examples/ricky.yaml) |


Read [Play a bit with Capact!](https://capact.io/blog/play-with-capact-via-cli) blog post to learn more.
