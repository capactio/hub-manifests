# Hub

The directory contains a representation of the OCH repository content.

The Hub contains the following groups:
- [`core`](manifests/core) - Contains OCH metadata with configuration and core manifests, such as Interfaces or Types.
  
    All `core` manifests are read-only and strictly connected to a specific OCH server version.
  
- [`implementation`](manifests/implementation) - Contains Implementation manifests. Implementation describes an action and its prerequisites. Action implements a given interface. The runner handles the execution of the action according to the “action” property, which describes how the function is run.
- [`interface`](manifests/interface) - Contains InterfaceGroup and Interface manifests. InterfaceGroup holds metadata for a group of Interfaces. Interface defines an action signature. It describes the action name, input and output parameters.
- [`type`](manifests/type) - Contains Type manifests. Type is a primitive, which is used in Interfaces as a description and validation of input and output parameters.
- [`attribute`](manifests/attribute) - Contains Attribute manifests. Attribute is used to categorize Implementations and Types.
- [`vendor`](manifests/vendor) - Contains metadata for external OCH repositories that are connected as a part of federation support. 
