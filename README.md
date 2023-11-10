# host-simulation
Simulation created to analyse how the number of devices in a network influence the network.

This simulation has a hard coded 50 ethernet connected devices, with a changing amount of wireless devices maxing out at 50 devices as well.

The results have been changed to excel form for ease of viewing.
Results can be found in results -> excel results.

To run this, you would need Omnet++ (6.0.1) IDE. Simply download and the project should be able to run on Omnet++.

For specifics:
There is one main server connected to a central switch.
Central switch is connected to five other switches, for easier explaination these will be called "side" switches.
The side switches have 10 devices connected through ethernet, and is also connected to an access point.
Each access point will have a minimum of two devices and maximum of 10 devices connected depending on device count specified.
There is an image on the root of this repo to show what the network looks like.

The network operates with a 0.1us delay and a 1000Mbps data rate.