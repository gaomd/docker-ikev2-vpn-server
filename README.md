# IKEv2 VPN Server on Docker

Recipe to build [`gaomd/ikev2-vpn-server`](https://registry.hub.docker.com/u/gaomd/ikev2-vpn-server/) Docker image.

## Usage

### 1. Start the IKEv2 VPN Server

    docker run --privileged -d --name ikev2-vpn-server --restart=always -p 500:500/udp -p 4500:4500/udp gaomd/ikev2-vpn-server:0.3.0

### 2. Generate the .mobileconfig (for iOS / macOS)

    docker run --privileged -i -t --rm --volumes-from ikev2-vpn-server -e "HOST=vpn1.example.com" gaomd/ikev2-vpn-server:0.3.0 generate-mobileconfig > ikev2-vpn.mobileconfig

*Be sure to replace `vpn1.example.com` with your own domain name and resolve it to you server's IP address. Simply put an IP address is supported as well (and enjoy an even faster handshake speed).*

Transfer the generated `ikev2-vpn.mobileconfig` file to your local computer via SSH tunnel (`scp`) or any other secure methods.

### 3. Install the .mobileconfig (for iOS / macOS)

- **iOS 9 or later**: AirDrop the `.mobileconfig` file to your iOS 9 device, finish the **Install Profile** screen;

- **macOS 10.11 El Capitan or later**: Double click the `.mobileconfig` file to start the *profile installation* wizard.

## Technical Details

Upon container creation, a *shared secret* was generated for authentication purpose, no *certificate*, *username*, or *password* was ever used, simple life!

## License

Copyright (c) 2016 Mengdi Gao, This software is licensed under the [MIT License](LICENSE).

---

\* IKEv2 protocol requires iOS 8 or later, macOS 10.11 El Capitan or later.

\* Install for **iOS 8 or later** or when your AirDrop fails: Send an E-mail to your iOS device with the `.mobileconfig` file as attachment, then tap the attachment to bring up and finish the **Install Profile** screen.
