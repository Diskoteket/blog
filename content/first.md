+++
title = "Getting the Bambulab P2S Camera feed into HomeAssistant"
date = 2026-09-04
+++

So about a year ago I got my first 3D-printer, I have had various issues with my
P2S and the camera feed in HomeAssistant and I thought i'd share how I solved
it.

## How To

### Prerequisites

- [HACS](https://www.hacs.xyz/docs/use/download/download/)
- [ha-bambulab integration](https://github.com/greghesp/ha-bambulab)

### Configure the P2S

In the printer settings, get the access code and enable `LAN Only Live View`
`Cog -> Settings -> LAN Only -> Access Code`.

I wanted to keep the possibility to start printing models from Bambu Handy so I
am keeping the cloud services.

### WebRTC Camera Integration

1. Install the [WebRTC](https://github.com/AlexxIT/WebRTC) integration via HACS
2. Visit `http://< your-homeassistant-ip>:1984`, this will take you to the
   go2rtc web interface
3. Go to `Config` and add the configuration shown below and click
   `Save & Restart`

```yaml
streams:
  p2s: rtsps://bblp:< access-code >@< your-bambulab-printer-ip >:322/streaming/live/1#media=video
```

### The Camera Feed in HomeAssistant

Create a custom card in a HomeAssistant view, paste the following contents:

```yaml
type: custom:webrtc-camera
url: p2s
media: video
mode: mse
```

Now you will have a low latency stream in your HomeAssistant dashboard. Happy
printing!
