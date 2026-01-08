# vTuner-Infra: A Free, Proxy-Based vTuner Alternative

This repository provides the infrastructure to deploy a free, self-hosted alternative to the vTuner internet radio service. It uses a forward proxy, which avoids the need for DNS hijacking and makes it compatible with devices on networks where custom DNS configuration is not possible on the DHCP server.

## The Problem

Many network audio devices (from brands like Yamaha, Pioneer, Denon) rely on the **vTuner** service to browse and play internet radio stations. This service can be unreliable, stations can be outdated, and it has moved to a paid model for some manufacturers.

The common self-hosted solution involves setting up a custom DNS server (like Pi-hole) to intercept requests to `*.vtuner.com` and redirect them to a local server. YTuner in this case.

However, this approach sometimes fails if your devices doesn't permit to configure
a custom DNS while keeping DHCP configuration.

## The Solution: A Proxy-Based Approach

**VTuner-Infra** solves this problem by replacing DNS redirection with an **HTTP Forward Proxy**.

Instead of changing DNS settings, you configure your audio device to use the proxy server provided by this project. Since almost all network devices allow manual proxy configuration, this method is far more reliable and widely compatible without any impact network wide.

### How It Works

1.  **Client Device (AV Receiver, etc.)**: You manually configure the HTTP proxy settings on your audio device to point to the IP address and port of the `TrafficServer` container.
2.  **Apache Traffic Server (Proxy)**: When your device tries to contact vTuner, the request is intercepted by the Traffic Server proxy. Its configuration (`records.yaml`) is set up to remap all `*.vtuner.com` requests to the appropriate local vTuner emulator using Pi-hole.
3.  **vTuner Emulators (YTuner)**:
    *   **YTuner**: A vTuner emulator that works well with Pioneer and other brands.
4.  **Pi-hole (Internal DNS)**: The proxy server itself uses the included Pi-hole container as its DNS resolver. This allows for stable internal name resolution and has the added benefit of potentially blocking ads within the radio streams, providing a cleaner listening experience.

## Getting Started

### Prerequisites

*   **Docker & Docker Compose**: All services are containerized. You must have Docker and Docker Compose installed.
*   **Static IP**: The machine running this infrastructure should have a static IP address on your local network. This is the IP you will use when configuring your audio devices.

### Installation & Configuration

Setup is managed entirely through `docker-compose`.

### Step 1: Configure Environment

In the `docker-compose.yml` file, you **must** change the `WEBPASSWORD` for the Pi-hole service to a secure password of your choice. You should also set your correct `TZ` (Timezone).

```yaml
services:
  pihole:
    # ...
    environment:
      TZ: 'Europe/Brussels' # Change to your timezone
      WEBPASSWORD: 'your-secure-password' # CHANGE THIS to a secure password
```

### Step 2: Configure Traffic Server Routes

to be complete

### Step 3: Launch the Services

Once configured, launch all the services using Docker Compose:

```bash
docker-compose up -d
```

All services will start in the background. You can access the Pi-hole web interface at `http://<your-docker-host-ip>:8088` to monitor DNS queries.

### Step 4: Configure Your Audio Device

1.  Find the network settings menu on your audio receiver or network player.
2.  Locate the **HTTP Proxy** or **Web Proxy** settings.
3.  Enter the static IP address of the machine running the Docker containers.
4.  Enter the `trafficserver` proxy port: **8080**.
5.  Save the settings. It may require a restart.

Your device will now route its internet radio requests through YCast-Infra, and you should be able to browse and play stations from your self-hosted service.

## Contributing

Contributions are welcome! If you have ideas for improvements or find a bug, please open an issue or submit a pull request.
