# Basic-Smart-Vacuum-Mop-Project-on-VHDL

## Description

This repository contains the code for a smart vacuum mop project implemented on the Basys3 FPGA development board. The project aims to create an intelligent device that moves in a straight line until it detects objects in front of it. When an obstacle is detected, it rotates in another direction to continue cleaning.

## Features

- Autonomous Vacuum Mop: The device autonomously moves in a straight line to clean the floor until an obstacle is detected.

- Obstacle Detection: The system uses an ultrasonic sensor to detect obstacles in front of the device.

- Rotation: When an obstacle is detected, the vacuum mop rotates in another direction to avoid the obstacle.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Requirements](#requirements)
- [Hardware Setup](#hardware-setup)
- [How to Use](#how-to-use)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Requirements

- Basys3 FPGA development board
- Xilinx Vivado Design Suite
- Ultrasonic Sensor
- DC Motors for Movement

## Hardware Setup

![Hardware Setup](images/hardware_setup.jpg)

1. Connect the Ultrasonic Sensor to the Basys3 board.
2. Connect the DC Motors for movement.
3. Set up the necessary connections and power supply.

## How to Use

1. Clone this repository to your local machine:

## bash
git clone https://github.com/your_username/smart-vacuum-mop.git
cd smart-vacuum-mop

Open the project in Xilinx Vivado Design Suite.
Synthesize and Implement the design.
Program the Basys3 board with the bitstream generated.
Place the device on the floor and power it on.

|-- README.md
|-- rtl
|   |-- bluetoothtop.vhd
|   |-- motordriver.vhd
|   |-- ultrasonicsensor.vhd
|   |-- dcmotor.vhd
|-- constraints
|   |-- basys3.xdc

## Contributing
Contributions to this project are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License.

## Acknowledgements
Special thanks to Your Name for providing the inspiration and guidance for this project.
