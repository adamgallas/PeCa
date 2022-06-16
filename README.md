# PeCa: A Portable and Efficient CNN Acclerator

## About PeCa

PeCa is:

- A simple but fully functional CNN accelerator.
- A standalone and portable accelerator. Just add the single PeCa_NxN.v source to your project, and you are good to go.
- A configurable accelerator which can be customized according to needs.

PeCa supports:

- Fixed kernel size convolution, such as 3x3, 5x5 convolution.
- 2x2 Maxpooling.
- INT8 inference.
- Various kinds of non-linear activation function.

PeCa is:
- Written in SpinalHDL.
- Based on the traditional line buffer mechanism.
- Designed using the valid-ready handshake protocal. Valid-Ready handshaking is everywhere in this accelerator design.

## How to use it

To generate customized configuration of PeCa, run the command line below in the listed directory and follow the instructions.

```sh
java -jar PeCaGen.jar
```
