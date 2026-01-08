# vTuner Infrastructure

## Project Overview

This repository contains the infrastructure for a home media streaming setup, managed with Docker. It consists of the following services:

*   **Pi-hole:** A network-wide ad blocker. It is configured to run on the host network.
*   **Traffic Server:** A caching proxy that sits in front of the other services. It is configured to cache HTTP requests and resolving request using Pi-hole.
*   **YCast:** A service that simulate vTuner API for free (obsolete).
*   **YTuner:** A service that simulate vTuner API for free (new).

## Building and Running

The services are built and deployed as Docker containers.

### Building

The `build.cmd` script builds and pushes the Docker images for the services.

```bash
.\build.cmd
```

### Running

The services are run as Docker containers.

*   **Pi-hole:** The `PiHole/setup.cmd` script runs the Pi-hole container.

## Development Conventions

*   The services are packaged as Docker containers.
*   The `build.cmd` script is used to build and push the Docker images.
*   The services are configured through a combination of configuration files and environment variables.
