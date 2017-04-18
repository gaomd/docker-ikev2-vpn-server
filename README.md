# IKEv2 VPN Server on Docker

Recipe to build [`nebukad/ikev2-vpn-alpine`](https://registry.hub.docker.com/u/nebukad/ikev2-vpn-alpine/) Docker image. Fork from [`gaomd/ikev2-vpn-server`](https://hub.docker.com/r/gaomd/ikev2-vpn-server/)

## Usage

### 1. Start the IKEv2 VPN Server

    docker run --privileged -d --name vpn-server --restart=always -p 500:500/udp -p 4500:4500/udp -e "HOST=<SERVER_IP>OR<FQDN>" -e "HOSTNAME=<SERVER_NAME> nebukad/ikev2-vpn-server:1.0

### 2. Generate the .mobileconfig (for iOS / macOS) to the current path

    docker exec -it vpn-server generate-mobileconfig > /home/docker/vpn/ikev2-vpn.mobileconfig

Transfer the generated `ikev2-vpn.mobileconfig` file to your local computer via SSH tunnel (`scp`) or any other secure methods.

### 3. Install the .mobileconfig (for iOS / macOS)

- **iOS 9 or later**: AirDrop the `.mobileconfig` file to your iOS 9 device, finish the **Install Profile** screen;

- **macOS 10.11 El Capitan or later**: Double click the `.mobileconfig` file to start the *profile installation* wizard.

## Technical Details

Upon container creation, a *shared secret* was generated for authentication purpose, no *certificate*, *username*, or *password* was ever used, simple life!

## License

Copyright (c) 2017 Mengdi Gao, Nebukad93,  This software is licensed under the [MIT License](LICENSE).

---

\* IKEv2 protocol requires iOS 8 or later, macOS 10.11 El Capitan or later.

\* Install for **iOS 8 or later** or when your AirDrop fails: Send an E-mail to your iOS device with the `.mobileconfig` file as attachment, then tap the attachment to bring up and finish the **Install Profile** screen.
