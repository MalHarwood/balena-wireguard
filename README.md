# balena-wireguard

[WireGuard®](https://www.wireguard.com/) is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.

## Hardware Required

- Raspberry Pi 3/3b/3b+
- balenaOS v2.80.3+rev1 (note that 64-bit OS is not supported)

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![Deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-wireguard&defaultDeviceType=raspberrypi3)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application,
flashing a device, downloading the project and pushing it via the [balena CLI](https://github.com/balena-io/balena-cli).

### Environment Variables

| Name           | Description                                                                                                                                                                                                                                                                                                                                |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SERVER_HOST`  | External IP or domain name for docker host. Used in server mode. If set to `auto` the container will try to determine and set the external IP automatically.                                                                                                                                                                               |
| `SERVER_PORT`  | External port for docker host. Defaults to `51820`.                                                                                                                                                                                                                                                                                        |
| `PEERS`        | Number of peers to create confs for. Can be a number like `4` or a list of names such as `myPC,myPhone,myTablet`.                                                                                                                                                                                                                          |
| `PEER_DNS`     | DNS server set in peer/client configs. Defaults to `1.1.1.1`.                                                                                                                                                                                                                                                                              |
| `NETWORK`      | Internal network CIDR for the wireguard and server and peers. Defaults to `10.13.13.0/24`.                                                                                                                                                                                                                                                 |
| `ALLOWEDIPS`   | The IPs/Ranges that the peers will be able to reach using the VPN connection. If not specified the default value is `0.0.0.0/0, ::0/0`. This will cause ALL traffic to route through the VPN, if you want split tunneling, set this to only the IPs you would like to use the tunnel AND the ip of the server's WG ip, such as 10.13.13.1. |
| `SET_HOSTNAME` | Set a custom hostname on application start. Defaults to `wireguard`.                                                                                                                                                                                                                                                                       |

## Usage/Examples

Once your device joins the fleet you'll need to allow some time for it to download the application and start the services.

When it's done you can display QR codes for each peer by running `show-peer <peer>` in the container shell.

Additional usage instructions for wireguard can be found here: <https://www.wireguard.com/>

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Versioning

Note that the current CI workflow will bump the version in
the main branch _after_the merged balenaCloud release has
been deployed as final.

As such, breaking changes may be introduced in `x.y.z-rev`
releases in the balenaCloud dashboard with no indication
that the major version was bumped as part of the same merge.

However each balenaCloud release version (draft or final)
will be tagged on the associated git commit so that should
be used as the source of truth.

## Acknowledgements

- <https://www.balena.io/blog/how-to-run-wireguard-vpn-in-balenaos/>
- <https://www.wireguard.com/compilation/>
- <https://github.com/linuxserver/docker-wireguard>
- <https://github.com/balena-os/kernel-module-build>
- <https://github.com/jaredallard-home/wireguard-balena-rpi>
